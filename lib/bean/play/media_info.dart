/*
* 作者 Ren
* 时间  2023/8/5 10:13
*/

import 'dart:typed_data';

import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:isar/isar.dart';

part 'media_info.g.dart';

enum SourceType { local, youtube, bilibili }

enum DownloadStatus { none, waiting, downloading, pause, success, failed }

enum MediaType { unknown, audio, video }

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
  @enumerated
  SourceType sourceType = SourceType.local;
  @enumerated
  DownloadStatus downloadStatus = DownloadStatus.none;

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
  String? downloadPath;
  int? downloadLength;
  int? downloadStartDate;
  int? downloadFinishDate;
  bool isLike = false;
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
    this.sourceType = SourceType.local,
    this.downloadStatus = DownloadStatus.none,
    this.assetsCreateDate = 0,
    this.assetsId,
    this.directoryId,
    this.directoryName,
    this.localPath,
    this.localBytesThumbnail,
  });

  MediaInfo.fromMap(Map map) {
    title = map['title'] ?? defaultTitle;
    author = map['author'] ?? defaultAuthor;
    width = map['width'];
    height = map['height'];
    createDate = map['createDate'] ?? 0;
    updateDate = map['updateDate'] ?? 0;
    duration = map['duration'] ?? 0;
    byteSize = map['byteSize'];
    isDelete = map['isDelete'] ?? false;
    playHistory = map['playHistory'];
    suffix = map['suffix'] ?? '';
    sourceType = map['sourceType'] ?? map['youtubeId'] != null ? SourceType.youtube : SourceType.local;
    downloadStatus = map['downloadStatus'] ?? DownloadStatus.none;
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
    downloadPath = map['downloadPath'];
    downloadLength = map['downloadLength'];
    downloadStartDate = map['downloadStartDate'];
    downloadFinishDate = map['downloadFinishDate'];
    isLike = map['isLike'] ?? false;
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
      'sourceType': sourceType,
      'downloadStatus': downloadStatus,
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
      'downloadPath': downloadPath,
      'downloadLength': downloadLength,
      'downloadStartDate': downloadStartDate,
      'downloadFinishDate': downloadFinishDate,
      'isLike': isLike,
      'likeCount': likeCount,
      'dislikeCount': dislikeCount,
    };
  }

  bool get isLocalVideo => sourceType == SourceType.local;

  String get identify => _getIdentify();

  String _getIdentify() {
    if (youtubeId != null) return youtubeId!;
    if (id > 0) return '$id';
    return '$title-$author-$duration';
  }

  int? get historyPosition => playHistory?.playPosition;

  double? get historyProgress => playHistory?.playPosition == null ? null : playHistory!.playPosition! / duration;

  String get createDateFormat => DateTime.fromMillisecondsSinceEpoch(createDate).format();

  String get updateDateFormat => DateTime.fromMillisecondsSinceEpoch(updateDate).format();

  String get durationFormat => Duration(milliseconds: duration).toSimpleString();

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

  @ignore
  Uint8List? get localUint8List => localBytesThumbnail == null ? null : Uint8List.fromList(localBytesThumbnail!);

  double? getVideoRatio() {
    if (width == null || height == null) return null;
    return width! / height!;
  }

  bool isNeedAudioTrack({int targetResolution = 720}) {
    return targetResolution >= 1080 || sourceType == SourceType.bilibili;
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

  @ignore
  bool get isLive => youtubeId != null && duration == 0;

  @override
  String toString() {
    return 'title= $title author= $author id= $id youtubeId= $youtubeId createDate= $createDate '
        'updateDate= $updateDate duration= $duration downloadStatus= $downloadStatus';
  }
}

@embedded
class PlayHistory {
  int? firstPlayDate;
  int? recentPlayDate;
  int? playPosition;

  PlayHistory({this.firstPlayDate, this.recentPlayDate, this.playPosition});
}

@embedded
class VideoSource {
  String url;
  String? label;
  String? format;
  int? byteSize;
  int? bitrate;
  int? width;
  int? height;
  bool isOnlyVideo;

  VideoSource(
      {this.url = '',
      this.label,
      this.format,
      this.bitrate,
      this.byteSize,
      this.width,
      this.height,
      this.isOnlyVideo = false});

  int getResolution() {
    if (width == null || height == null) return 0;
    if (width! >= height!) {
      return height!;
    } else {
      return width!;
    }
  }
}

@embedded
class AudioSource {
  String url;
  int? byteSize;
  int? bitrate;

  AudioSource({this.url = '', this.bitrate, this.byteSize});
}
