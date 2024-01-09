/*
* 作者 Ren
* 时间  2024/1/6 15:13
*/

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class ShortVideoApi extends BaseDio {
  Future<MediaInfo?> requestShortVideoItem({String? videoParams, String? playParams, String? videoId}) async {
    try {
      final commonParams = API.getWebCommonParams();
      final params = {...commonParams, 'params': videoParams ?? 'CA8%3D'};
      if (playParams != null && videoId != null) {
        params['playerRequest'] = {'params': playParams, 'videoId': videoId};
      } else {
        params['inputType'] = 'REEL_WATCH_INPUT_TYPE_SEEDLESS';
      }
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.shortVideoParams, data: paramsJson);
      if (response?.data == null) return null;
      final responseData = response?.data;

      final sequenceContinuation = responseData?['sequenceContinuation'];
      final playerParams = responseData?['replacementEndpoint']?['reelWatchEndpoint']?['playerParams'];
      final pPrams = responseData?['replacementEndpoint']?['reelWatchEndpoint']?['params'];

      final playerResponse = responseData['playerResponse'];
      if (playerResponse == null) return null;
      final videoDetails = playerResponse?['videoDetails'];
      final youtubeId = videoDetails['videoId'];
      if (youtubeId == null) return null;
      final isLiveContent = videoDetails['isLiveContent'] ?? false;
      if (isLiveContent) return null;

      final title = videoDetails['title'];
      final authorId = videoDetails['channelId'];
      List thumbnails = videoDetails['thumbnail']?['thumbnails'] ?? [];
      String? thumbnail;
      if (thumbnails.isNotEmpty) {
        thumbnail = thumbnails.last['url'];
      }
      final viewCount = videoDetails['viewCount'] ?? 0;
      final author = videoDetails['author'];
      List formats = responseData['streamingData']?['formats'] ?? [];
      VideoSource? videoSource;
      int duration = 0;
      if (formats.isNotEmpty) {
        final format = formats.last;
        final url = format['url'] ?? '';
        final width = format['width'] ?? 1080;
        final height = format['height'] ?? 1920;
        final label = format['qualityLabel'] ?? '720p';
        duration = format['approxDurationMs'] ?? 0;
        videoSource = VideoSource();
        videoSource.url = url;
        videoSource.width = width;
        videoSource.height = height;
        videoSource.label = label;
      }

      List channelThumbnails = responseData['overlay']?['reelPlayerHeaderSupportedRenderers']
              ?['reelPlayerHeaderRenderer']?['channelThumbnail']?['thumbnails'] ??
          [];
      String? channelThumb;
      if (channelThumbnails.isNotEmpty) {
        channelThumb = channelThumbnails.last['url'];
      }
      final mediaInfo = MediaInfo();
      mediaInfo.sequenceContinuation = sequenceContinuation;
      mediaInfo.playParams = playerParams;
      mediaInfo.params = pPrams;
      mediaInfo.youtubeId = youtubeId;
      mediaInfo.title = title;
      mediaInfo.author = author;
      mediaInfo.authorId = authorId;
      mediaInfo.thumbnail = thumbnail;
      mediaInfo.viewCountText = viewCount;
      mediaInfo.duration = duration;
      if (videoSource != null) {
        mediaInfo.videoSources = [videoSource];
      }
      mediaInfo.authorThumbnail = channelThumb;
      return mediaInfo;
    } catch (e) {
      LogUtils.e('请求短视频播首个视频出错 $e');
    }
    return null;
  }

  Future<List<MediaInfo>> requestShortVideos({ValueChanged<ContinueInfo>? onContinueCallback}) async {
    try {
      final firstMediaInfo = await requestShortVideoItem();
      if (firstMediaInfo == null || firstMediaInfo.sequenceContinuation == null) return [];
      //请求列表
      final mediaInfoList = <MediaInfo>[firstMediaInfo];
      final sequenceMediaInfoList = await requestShortVideoSequence(
          sequenceContinuation: firstMediaInfo.sequenceContinuation, onContinueCallback: onContinueCallback);
      mediaInfoList.addAll(sequenceMediaInfoList);
      return mediaInfoList;
    } catch (e) {
      LogUtils.e('请求短视频播放列表出错 $e');
    }
    return [];
  }

  Future<List<MediaInfo>> requestShortVideoSequence(
      {String? sequenceContinuation,
      ContinueInfo? continueInfo,
      ValueChanged<ContinueInfo>? onContinueCallback}) async {
    try {
      final mediaInfoList = <MediaInfo>[];
      final commonParams = API.getWebCommonParams();
      final params = {...commonParams};
      if (sequenceContinuation != null) {
        params['sequenceParams'] = sequenceContinuation;
      } else if (continueInfo != null) {
        params['continuation'] = continueInfo.continuationCommand;
        final contextMap = params['context'];
        if (continueInfo.clickTrackingParams != null) {
          contextMap['clickTracking'] = {'clickTrackingParams': continueInfo.clickTrackingParams};
        }
      }
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.shortVideoSequence, data: paramsJson, header: {
        'X-Goog-Visitor-Id': API.visitorData,
        'Content-Type': 'application/json',
      });
      if (response?.data == null) return mediaInfoList;
      final responseData = response?.data;

      //获取continuation
      final continuationCommand = responseData?['continuationEndpoint']?['continuationCommand']?['token'];
      final clickTrackingParams = responseData?['continuationEndpoint']?['clickTrackingParams'];
      //解析视频数据
      List entries = responseData?['entries'] ?? [];
      if (entries.isEmpty) return mediaInfoList;

      for (final entry in entries) {
        final watchEndpoint = entry['command']?['reelWatchEndpoint'];
        if (watchEndpoint == null) continue;
        final youtubeId = watchEndpoint['videoId'];
        if (youtubeId == null) continue;
        List thumbnails = watchEndpoint['thumbnail']?['thumbnails'] ?? [];
        String? thumbnail;
        if (thumbnails.isNotEmpty) thumbnail = thumbnails.last['url'];
        final playerParams = watchEndpoint['playerParams'];
        final params = watchEndpoint['params'];
        final mediaInfo = MediaInfo();
        mediaInfo.youtubeId = youtubeId;
        mediaInfo.thumbnail = thumbnail;
        mediaInfo.playParams = playerParams;
        mediaInfo.params = params;
        mediaInfoList.add(mediaInfo);
      }
      onContinueCallback?.call(ContinueInfo()
        ..continuationCommand = continuationCommand
        ..clickTrackingParams = clickTrackingParams
        ..lastYoutubeId = mediaInfoList.isNotEmpty ? mediaInfoList[mediaInfoList.length - 2].youtubeId : null);
      return mediaInfoList;
    } catch (e) {
      LogUtils.e('请求短视频播放列表出错 $e');
    }
    return [];
  }
}

class ContinueInfo {
  String? continuationCommand;
  String? clickTrackingParams;
  String? lastYoutubeId;
}
