/*
* 作者 Ren
* 时间  2023/8/5 10:13
*/

import 'dart:typed_data';

import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:isar/isar.dart';

part 'media_info.g.dart';

enum SourceType { local, youtube }

enum DownloadStatus { none, waiting, downloading, pause, success, failed }

enum MediaType { unknown, audio, video }

@collection
class MediaInfo {
  static const defaultTitle = 'Unknown name';
  static const defaultAuthor = 'Unknown author';
  Id id = Isar.autoIncrement;

  String title = defaultTitle;
  String author = defaultTitle;
  int? width = 0;
  int? height = 0;
  int createDate = 0;
  int updateDate = 0;
  int duration = 0;
  int? byteSize;
  bool isDelete = false;
  PlayHistory? playHistory;
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
  String? description;
  String? publishedTime;
  String? viewCountText;
  String? downloadPath;
  double? downloadProgress;

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
