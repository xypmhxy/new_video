/*
* 作者 Ren
* 时间  2023/8/5 10:13
*/

import 'dart:math';
import 'dart:typed_data';

import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:isar/isar.dart';

part 'media_info.g.dart';

enum SourceType { local, youtube, bilibili }

enum DownloadStatus { none, waiting, downloading, pause, success, failed }

@collection
class MediaInfo {
  static const defaultTitle = 'Unknown name';
  static const defaultAuthor = 'Unknown author';
  Id id = Isar.autoIncrement;

  String title = defaultTitle;
  String author = defaultTitle;
  int? width;
  int? height;
  int createDate = 0;
  int updateDate = 0;
  int duration = 0;
  int? byteSize;
  bool isDelete = false;
  PlayHistory? playHistory;
  List<VideoSource>? videoSources;
  List<AudioSource>? audioSources;
  String suffix = '';

  //local
  int assetsCreateDate = 0;
  String? assetsId;
  int? directoryId;
  String? directoryName;
  String? localPath; //本地存放相对路径
  List<byte>? localBytesThumbnail;

  //youtube
  String? youtubeId;
  String? thumbnail;
  String? authorThumbnail;
  String? authorId;
  String? description;
  String? publishedTime;
  String? viewCountText;
  int recentGetUrlTime = 0;

  int? likeCount;
  int? dislikeCount;

  MediaInfo();

  MediaInfo.create({
    this.title = defaultTitle,
    this.author = defaultAuthor,
    this.width,
    this.height,
    this.createDate = 0,
    this.updateDate = 0,
    this.duration = 0,
    this.byteSize,
    this.isDelete = false,
    this.playHistory,
    this.suffix = '',
    this.assetsCreateDate = 0,
    this.assetsId,
    this.directoryId,
    this.directoryName,
    this.localPath,
    this.localBytesThumbnail,
  });

  MediaInfo.fromMap(Map map) {
    final nowDate = DateTime.now().millisecondsSinceEpoch;
    title = map['title'] ?? defaultTitle;
    author = map['author'] ?? defaultAuthor;
    width = map['width'];
    height = map['height'];
    createDate = map['createDate'] ?? nowDate;
    updateDate = map['updateDate'] ?? nowDate;
    duration = map['duration'] ?? 0;
    byteSize = map['byteSize'];
    isDelete = map['isDelete'] ?? false;
    playHistory = map['playHistory'];
    suffix = map['suffix'] ?? '';
    // sourceType = map['sourceType'] ?? map['youtubeId'] != null ? SourceType.youtube : SourceType.local;
    assetsCreateDate = map['assetsCreateDate'] ?? 0;
    assetsId = map['assetsId'];
    directoryId = map['directoryId'];
    directoryName = map['directoryName'];
    localPath = map['localPath'];
    localBytesThumbnail = map['localBytesThumbnail'];
    youtubeId = map['youtubeId'];
    thumbnail = map['thumbnail'];
    authorThumbnail = map['authorThumbnail'];
    authorId = map['authorId'];
    description = map['description'];
    publishedTime = map['publishedTime'];
    viewCountText = map['viewCountText'];
    likeCount = map['likeCount'];
    dislikeCount = map['dislikeCount'];
  }

  Map toJson() {
    return {
      'title': title,
      'author': author,
      'width': width,
      'height': height,
      'createDate': createDate,
      'updateDate': updateDate,
      'duration': duration,
      'byteSize': byteSize,
      'isDelete': isDelete,
      'playHistory': playHistory,
      'suffix': suffix,
      'assetsCreateDate': assetsCreateDate,
      'assetsId': assetsId,
      'directoryId': directoryId,
      'directoryName': directoryName,
      'localPath': localPath,
      'localBytesThumbnail': localBytesThumbnail,
      'youtubeId': youtubeId,
      'thumbnail': thumbnail,
      'authorThumbnail': authorThumbnail,
      'authorId': authorId,
      'description': description,
      'publishedTime': publishedTime,
      'viewCountText': viewCountText,
      'likeCount': likeCount,
      'dislikeCount': dislikeCount,
    };
  }

  // bool get isLocalVideo => sourceType == SourceType.local;

  String get identify => _getIdentify();

  String _getIdentify() {
    if (youtubeId != null) return youtubeId!;
    if (id > 0) return '$id';
    return '$title-$author-$duration';
  }

  int? get historyPosition => playHistory?.playPosition;

  double? get historyProgress => playHistory?.playPosition == null ? null : playHistory!.playPosition! / duration;

  int get recentPlayDate => playHistory?.recentPlayDate ?? 0;

  String get createDateFormat => DateTime.fromMillisecondsSinceEpoch(createDate).format();

  String get updateDateFormat => DateTime.fromMillisecondsSinceEpoch(updateDate).format();

  String get durationFormat => Duration(milliseconds: duration).toSimpleString();

  @ignore
  bool get isLive => youtubeId != null && duration == 0;

  @ignore
  bool get isLocalVideo => localPath != null && youtubeId == null;

  @ignore
  Uint8List? get localUint8List => localBytesThumbnail == null ? null : Uint8List.fromList(localBytesThumbnail!);

  String formatSize() {
    if (byteSize == null || byteSize == 0) return '0MB';
    final sizeMB = byteSize! / 1024 / 1024;
    if (sizeMB >= 1024) {
      final sizeGB = sizeMB / 1024;
      return '${sizeGB.toStringAsFixed(2)}G';
    }
    return '${sizeMB.toStringAsFixed(2)}MB';
  }

  bool isSame(MediaInfo? mediaInfo) {
    return mediaInfo?.identify == identify;
  }

  String getResolutionFormat() {
    if (width != null && height != null) {
      return '$width x $height';
    }
    final sourceWidth = videoSources?.first.width;
    final sourceHeight = videoSources?.first.height;
    if (sourceWidth != null && sourceHeight != null) {
      return '$sourceWidth x $sourceHeight';
    }
    return '720 x 1280';
  }

  double? getVideoRatio() {
    if (width == null || height == null) return null;
    return width! / height!;
  }

  VideoSource? getVideoSource(int width) {
    return videoSources?.firstWhere((element) => element.width == width && element.isOnlyVideo == false);
  }

  String formatLikeCount() {
    if (likeCount == null) return '-';
    if (likeCount! >= 1000000) {
      final likeK = (likeCount! / 1000000).toStringAsFixed(1);
      return '${likeK}M';
    } else if (likeCount! >= 10000) {
      final likeK = (likeCount! / 1000).toStringAsFixed(1);
      return '${likeK}K';
    }
    return '$likeCount';
  }

  String formatDislikeCount() {
    if (dislikeCount == null) return '-';
    if (dislikeCount! >= 1000000) {
      final likeK = (dislikeCount! / 1000000).toStringAsFixed(1);
      return '${likeK}M';
    } else if (dislikeCount! >= 10000) {
      final likeK = (dislikeCount! / 1000).toStringAsFixed(1);
      return '${likeK}K';
    }
    return '$dislikeCount';
  }

  bool isUrlAvailable() {
    if (recentGetUrlTime <= 0) return false;
    final nowDate = DateTime.now().millisecondsSinceEpoch;
    final intervalTime = nowDate - recentGetUrlTime;
    return intervalTime <= DateUtil.MIN * 90;
  }

  @override
  String toString() {
    return 'title= $title author= $author id= $id youtubeId= $youtubeId createDate= $createDate '
        'updateDate= $updateDate duration= $duration';
  }
}

@embedded
class PlayHistory {
  int? firstPlayDate;
  int? recentPlayDate;
  int? playPosition;

  PlayHistory({this.firstPlayDate, this.recentPlayDate, this.playPosition});
}

class BaseMediaSource {
  String url = '';
  String? label;
  String? format;
  int? byteSize;
  int? bitrate;
  @enumerated
  SourceType sourceType = SourceType.local;
  AudioSource? audioSource;

  @enumerated
  DownloadStatus downloadStatus = DownloadStatus.none;
  // int? fileLength;
  int? downloadLength;
  int? downloadStartDate;
  int? downloadFinishDate;
  String? downloadPath;

  BaseMediaSource({this.url = '', this.label, this.format, this.bitrate, this.byteSize, this.audioSource});

  @ignore
  String get identify => label ?? url;

  @ignore
  int get realTotalLength => (byteSize ?? 0) + (audioSource?.byteSize ?? 0);

  @ignore
  bool get isDownloadNone => downloadStatus == DownloadStatus.none;

  @ignore
  bool get isDownloading => downloadStatus == DownloadStatus.downloading;

  @ignore
  bool get isWaiting => downloadStatus == DownloadStatus.waiting;

  @ignore
  bool get isInQueue => isWaiting || isDownloading || isPause || isFailed;

  @ignore
  bool get isPause => downloadStatus == DownloadStatus.pause;

  @ignore
  bool get isSuccess => downloadStatus == DownloadStatus.success;

  @ignore
  bool get isFailed => downloadStatus == DownloadStatus.failed;

  double downloadProgress() {
    if (downloadLength == null || byteSize == null) return 0;
    final totalLength = byteSize! + (audioSource?.byteSize ?? 0);
    final totalDownload = downloadLength! + (audioSource?.downloadLength ?? 0);
    return totalDownload / totalLength;
  }

  @ignore
  bool get isDownloadAvailable => isSuccess && downloadPath != null;

  @ignore
  bool get isYoutube => sourceType == SourceType.youtube;

  @ignore
  bool get isBilibili => sourceType == SourceType.bilibili;

  @ignore
  String get downloadFinishFormatDate => DateTime.fromMillisecondsSinceEpoch(downloadFinishDate ?? 0).format();

  void clearDownload() {
    downloadStartDate = null;
    downloadFinishDate = null;
    downloadPath = null;
    downloadLength = null;
    downloadStatus = DownloadStatus.none;
    audioSource?.clearDownload();
  }
}

@embedded
class VideoSource extends BaseMediaSource {
  int? width;
  int? height;
  int? fps;
  bool isOnlyVideo;

  VideoSource(
      {super.url = '',
      super.label,
      super.format,
      super.bitrate,
      super.byteSize,
      this.fps,
      this.width,
      this.height,
      this.isOnlyVideo = false});

  int getResolution() {
    if (width == null || height == null) return 0;
    return min(width!, height!);
  }

  String formatSize() {
    if (byteSize == null || byteSize == 0) return '0MB';
    final sizeMB = byteSize! / 1024 / 1024;
    if (sizeMB >= 1024) {
      final sizeGB = sizeMB / 1024;
      return '${sizeGB.toStringAsFixed(2)}G';
    }
    return '${sizeMB.toStringAsFixed(1)}MB';
  }

  bool isNeedAudioTrack() {
    return isBilibili || audioSource != null;
  }

  String get resolution => '${width}x$height';
}

@embedded
class AudioSource extends BaseMediaSource {
  AudioSource({super.url = '', super.label, super.format, super.bitrate, super.byteSize});

  String formatSize() {
    if (byteSize == null || byteSize == 0) return '0MB';
    final sizeMB = byteSize! / 1024 / 1024;
    if (sizeMB >= 1024) {
      final sizeGB = sizeMB / 1024;
      return '${sizeGB.toStringAsFixed(2)}G';
    }
    return '${sizeMB.toStringAsFixed(1)}MB';
  }

  String formatBitrate() {
    if (bitrate == null || bitrate == 0) return '0 Kbit/s';
    final sizeKB = bitrate! / 1024;
    if (sizeKB >= 1024) {
      final sizeMB = sizeKB / 1024;
      return '${sizeMB.toStringAsFixed(1)} Mbit/s';
    }
    return '${sizeKB.toStringAsFixed(1)} Kbit/s';
  }
}
