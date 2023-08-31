// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMediaInfoCollection on Isar {
  IsarCollection<MediaInfo> get mediaInfos => this.collection();
}

const MediaInfoSchema = CollectionSchema(
  name: r'MediaInfo',
  id: 7159810344845104515,
  properties: {
    r'assetsCreateDate': PropertySchema(
      id: 0,
      name: r'assetsCreateDate',
      type: IsarType.long,
    ),
    r'assetsId': PropertySchema(
      id: 1,
      name: r'assetsId',
      type: IsarType.string,
    ),
    r'author': PropertySchema(
      id: 2,
      name: r'author',
      type: IsarType.string,
    ),
    r'authorThumbnail': PropertySchema(
      id: 3,
      name: r'authorThumbnail',
      type: IsarType.string,
    ),
    r'byteSize': PropertySchema(
      id: 4,
      name: r'byteSize',
      type: IsarType.long,
    ),
    r'createDate': PropertySchema(
      id: 5,
      name: r'createDate',
      type: IsarType.long,
    ),
    r'createDateFormat': PropertySchema(
      id: 6,
      name: r'createDateFormat',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'directoryId': PropertySchema(
      id: 8,
      name: r'directoryId',
      type: IsarType.long,
    ),
    r'directoryName': PropertySchema(
      id: 9,
      name: r'directoryName',
      type: IsarType.string,
    ),
    r'downloadPath': PropertySchema(
      id: 10,
      name: r'downloadPath',
      type: IsarType.string,
    ),
    r'downloadProgress': PropertySchema(
      id: 11,
      name: r'downloadProgress',
      type: IsarType.double,
    ),
    r'downloadStatus': PropertySchema(
      id: 12,
      name: r'downloadStatus',
      type: IsarType.byte,
      enumMap: _MediaInfodownloadStatusEnumValueMap,
    ),
    r'duration': PropertySchema(
      id: 13,
      name: r'duration',
      type: IsarType.long,
    ),
    r'height': PropertySchema(
      id: 14,
      name: r'height',
      type: IsarType.long,
    ),
    r'historyPosition': PropertySchema(
      id: 15,
      name: r'historyPosition',
      type: IsarType.long,
    ),
    r'historyProgress': PropertySchema(
      id: 16,
      name: r'historyProgress',
      type: IsarType.double,
    ),
    r'identify': PropertySchema(
      id: 17,
      name: r'identify',
      type: IsarType.string,
    ),
    r'isDelete': PropertySchema(
      id: 18,
      name: r'isDelete',
      type: IsarType.bool,
    ),
    r'isLocalVideo': PropertySchema(
      id: 19,
      name: r'isLocalVideo',
      type: IsarType.bool,
    ),
    r'localBytesThumbnail': PropertySchema(
      id: 20,
      name: r'localBytesThumbnail',
      type: IsarType.byteList,
    ),
    r'localPath': PropertySchema(
      id: 21,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'playHistory': PropertySchema(
      id: 22,
      name: r'playHistory',
      type: IsarType.object,
      target: r'PlayHistory',
    ),
    r'publishedTime': PropertySchema(
      id: 23,
      name: r'publishedTime',
      type: IsarType.string,
    ),
    r'sourceType': PropertySchema(
      id: 24,
      name: r'sourceType',
      type: IsarType.byte,
      enumMap: _MediaInfosourceTypeEnumValueMap,
    ),
    r'suffix': PropertySchema(
      id: 25,
      name: r'suffix',
      type: IsarType.string,
    ),
    r'thumbnail': PropertySchema(
      id: 26,
      name: r'thumbnail',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 27,
      name: r'title',
      type: IsarType.string,
    ),
    r'updateDate': PropertySchema(
      id: 28,
      name: r'updateDate',
      type: IsarType.long,
    ),
    r'updateDateFormat': PropertySchema(
      id: 29,
      name: r'updateDateFormat',
      type: IsarType.string,
    ),
    r'viewCountText': PropertySchema(
      id: 30,
      name: r'viewCountText',
      type: IsarType.string,
    ),
    r'width': PropertySchema(
      id: 31,
      name: r'width',
      type: IsarType.long,
    ),
    r'youtubeId': PropertySchema(
      id: 32,
      name: r'youtubeId',
      type: IsarType.string,
    )
  },
  estimateSize: _mediaInfoEstimateSize,
  serialize: _mediaInfoSerialize,
  deserialize: _mediaInfoDeserialize,
  deserializeProp: _mediaInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'PlayHistory': PlayHistorySchema},
  getId: _mediaInfoGetId,
  getLinks: _mediaInfoGetLinks,
  attach: _mediaInfoAttach,
  version: '3.1.0+1',
);

int _mediaInfoEstimateSize(
  MediaInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assetsId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.author.length * 3;
  {
    final value = object.authorThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.createDateFormat.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.directoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.downloadPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.identify.length * 3;
  {
    final value = object.localBytesThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.localPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.playHistory;
    if (value != null) {
      bytesCount += 3 +
          PlayHistorySchema.estimateSize(
              value, allOffsets[PlayHistory]!, allOffsets);
    }
  }
  {
    final value = object.publishedTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.suffix.length * 3;
  {
    final value = object.thumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.updateDateFormat.length * 3;
  {
    final value = object.viewCountText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.youtubeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mediaInfoSerialize(
  MediaInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assetsCreateDate);
  writer.writeString(offsets[1], object.assetsId);
  writer.writeString(offsets[2], object.author);
  writer.writeString(offsets[3], object.authorThumbnail);
  writer.writeLong(offsets[4], object.byteSize);
  writer.writeLong(offsets[5], object.createDate);
  writer.writeString(offsets[6], object.createDateFormat);
  writer.writeString(offsets[7], object.description);
  writer.writeLong(offsets[8], object.directoryId);
  writer.writeString(offsets[9], object.directoryName);
  writer.writeString(offsets[10], object.downloadPath);
  writer.writeDouble(offsets[11], object.downloadProgress);
  writer.writeByte(offsets[12], object.downloadStatus.index);
  writer.writeLong(offsets[13], object.duration);
  writer.writeLong(offsets[14], object.height);
  writer.writeLong(offsets[15], object.historyPosition);
  writer.writeDouble(offsets[16], object.historyProgress);
  writer.writeString(offsets[17], object.identify);
  writer.writeBool(offsets[18], object.isDelete);
  writer.writeBool(offsets[19], object.isLocalVideo);
  writer.writeByteList(offsets[20], object.localBytesThumbnail);
  writer.writeString(offsets[21], object.localPath);
  writer.writeObject<PlayHistory>(
    offsets[22],
    allOffsets,
    PlayHistorySchema.serialize,
    object.playHistory,
  );
  writer.writeString(offsets[23], object.publishedTime);
  writer.writeByte(offsets[24], object.sourceType.index);
  writer.writeString(offsets[25], object.suffix);
  writer.writeString(offsets[26], object.thumbnail);
  writer.writeString(offsets[27], object.title);
  writer.writeLong(offsets[28], object.updateDate);
  writer.writeString(offsets[29], object.updateDateFormat);
  writer.writeString(offsets[30], object.viewCountText);
  writer.writeLong(offsets[31], object.width);
  writer.writeString(offsets[32], object.youtubeId);
}

MediaInfo _mediaInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaInfo();
  object.assetsCreateDate = reader.readLong(offsets[0]);
  object.assetsId = reader.readStringOrNull(offsets[1]);
  object.author = reader.readString(offsets[2]);
  object.authorThumbnail = reader.readStringOrNull(offsets[3]);
  object.byteSize = reader.readLongOrNull(offsets[4]);
  object.createDate = reader.readLong(offsets[5]);
  object.description = reader.readStringOrNull(offsets[7]);
  object.directoryId = reader.readLongOrNull(offsets[8]);
  object.directoryName = reader.readStringOrNull(offsets[9]);
  object.downloadPath = reader.readStringOrNull(offsets[10]);
  object.downloadProgress = reader.readDoubleOrNull(offsets[11]);
  object.downloadStatus = _MediaInfodownloadStatusValueEnumMap[
          reader.readByteOrNull(offsets[12])] ??
      DownloadStatus.none;
  object.duration = reader.readLong(offsets[13]);
  object.height = reader.readLongOrNull(offsets[14]);
  object.id = id;
  object.isDelete = reader.readBool(offsets[18]);
  object.localBytesThumbnail = reader.readByteList(offsets[20]);
  object.localPath = reader.readStringOrNull(offsets[21]);
  object.playHistory = reader.readObjectOrNull<PlayHistory>(
    offsets[22],
    PlayHistorySchema.deserialize,
    allOffsets,
  );
  object.publishedTime = reader.readStringOrNull(offsets[23]);
  object.sourceType =
      _MediaInfosourceTypeValueEnumMap[reader.readByteOrNull(offsets[24])] ??
          SourceType.local;
  object.suffix = reader.readString(offsets[25]);
  object.thumbnail = reader.readStringOrNull(offsets[26]);
  object.title = reader.readString(offsets[27]);
  object.updateDate = reader.readLong(offsets[28]);
  object.viewCountText = reader.readStringOrNull(offsets[30]);
  object.width = reader.readLongOrNull(offsets[31]);
  object.youtubeId = reader.readStringOrNull(offsets[32]);
  return object;
}

P _mediaInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (_MediaInfodownloadStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DownloadStatus.none) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readByteList(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readObjectOrNull<PlayHistory>(
        offset,
        PlayHistorySchema.deserialize,
        allOffsets,
      )) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (_MediaInfosourceTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          SourceType.local) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MediaInfodownloadStatusEnumValueMap = {
  'none': 0,
  'waiting': 1,
  'downloading': 2,
  'pause': 3,
  'success': 4,
  'failed': 5,
};
const _MediaInfodownloadStatusValueEnumMap = {
  0: DownloadStatus.none,
  1: DownloadStatus.waiting,
  2: DownloadStatus.downloading,
  3: DownloadStatus.pause,
  4: DownloadStatus.success,
  5: DownloadStatus.failed,
};
const _MediaInfosourceTypeEnumValueMap = {
  'local': 0,
  'youtube': 1,
};
const _MediaInfosourceTypeValueEnumMap = {
  0: SourceType.local,
  1: SourceType.youtube,
};

Id _mediaInfoGetId(MediaInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mediaInfoGetLinks(MediaInfo object) {
  return [];
}

void _mediaInfoAttach(IsarCollection<dynamic> col, Id id, MediaInfo object) {
  object.id = id;
}

extension MediaInfoQueryWhereSort
    on QueryBuilder<MediaInfo, MediaInfo, QWhere> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MediaInfoQueryWhere
    on QueryBuilder<MediaInfo, MediaInfo, QWhereClause> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MediaInfoQueryFilter
    on QueryBuilder<MediaInfo, MediaInfo, QFilterCondition> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsCreateDateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetsCreateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsCreateDateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetsCreateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsCreateDateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetsCreateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsCreateDateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetsCreateDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetsId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetsId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetsId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> assetsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetsId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      assetsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetsId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorThumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorThumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> byteSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      byteSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> byteSizeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byteSize',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> byteSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'byteSize',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> byteSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'byteSize',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> byteSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'byteSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> createDateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> createDateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> createDateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDateFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDateFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDateFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      createDateFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDateFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directoryId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directoryId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> directoryIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'directoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> directoryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'directoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> directoryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'directoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directoryName',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directoryName',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'directoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'directoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'directoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      directoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'directoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> downloadPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> downloadPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> downloadPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadProgress',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadProgress',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadProgressBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadStatusEqualTo(DownloadStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadStatusGreaterThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadStatusLessThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      downloadStatusBetween(
    DownloadStatus lower,
    DownloadStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> durationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> durationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> durationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> durationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> heightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'historyPosition',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'historyPosition',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyPosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'historyProgress',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'historyProgress',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      historyProgressBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identify',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identify',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identify',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> identifyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identify',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      identifyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identify',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> isDeleteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> isLocalVideoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocalVideo',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localBytesThumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localBytesThumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localBytesThumbnail',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localBytesThumbnail',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localBytesThumbnail',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localBytesThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localBytesThumbnailLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'localBytesThumbnail',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      playHistoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playHistory',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      playHistoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playHistory',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishedTime',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishedTime',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publishedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publishedTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      publishedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publishedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> sourceTypeEqualTo(
      SourceType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      sourceTypeGreaterThan(
    SourceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceType',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> sourceTypeLessThan(
    SourceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceType',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> sourceTypeBetween(
    SourceType lower,
    SourceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suffix',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suffix',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suffix',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> suffixIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suffix',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      thumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      thumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> thumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      thumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> updateDateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> updateDateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> updateDateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDateFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDateFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDateFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDateFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      updateDateFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDateFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'viewCountText',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'viewCountText',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewCountText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'viewCountText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'viewCountText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewCountText',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      viewCountTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'viewCountText',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> widthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'youtubeId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      youtubeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'youtubeId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      youtubeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'youtubeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'youtubeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'youtubeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> youtubeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      youtubeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'youtubeId',
        value: '',
      ));
    });
  }
}

extension MediaInfoQueryObject
    on QueryBuilder<MediaInfo, MediaInfo, QFilterCondition> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> playHistory(
      FilterQuery<PlayHistory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'playHistory');
    });
  }
}

extension MediaInfoQueryLinks
    on QueryBuilder<MediaInfo, MediaInfo, QFilterCondition> {}

extension MediaInfoQuerySortBy on QueryBuilder<MediaInfo, MediaInfo, QSortBy> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAssetsCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsCreateDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      sortByAssetsCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsCreateDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAssetsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAssetsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsId', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthorThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorThumbnail', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthorThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorThumbnail', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByByteSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byteSize', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByByteSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byteSize', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByCreateDateFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      sortByCreateDateFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateFormat', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDirectoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDirectoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryId', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDirectoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryName', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDirectoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryName', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDownloadPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDownloadPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      sortByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDownloadStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHistoryPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyPosition', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHistoryPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyPosition', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHistoryProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyProgress', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByHistoryProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyProgress', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIdentify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identify', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIdentifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identify', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDelete', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDelete', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsLocalVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocalVideo', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsLocalVideoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocalVideo', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByPublishedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedTime', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByPublishedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedTime', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortBySuffix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suffix', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortBySuffixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suffix', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByUpdateDateFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDateFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      sortByUpdateDateFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDateFormat', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByViewCountText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCountText', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByViewCountTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCountText', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByYoutubeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByYoutubeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeId', Sort.desc);
    });
  }
}

extension MediaInfoQuerySortThenBy
    on QueryBuilder<MediaInfo, MediaInfo, QSortThenBy> {
  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAssetsCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsCreateDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      thenByAssetsCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsCreateDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAssetsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAssetsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetsId', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthorThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorThumbnail', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthorThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorThumbnail', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByByteSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byteSize', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByByteSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byteSize', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByCreateDateFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      thenByCreateDateFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateFormat', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDirectoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDirectoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryId', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDirectoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryName', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDirectoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directoryName', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDownloadPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDownloadPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      thenByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDownloadStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHistoryPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyPosition', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHistoryPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyPosition', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHistoryProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyProgress', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByHistoryProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historyProgress', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIdentify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identify', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIdentifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identify', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDelete', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDelete', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsLocalVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocalVideo', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsLocalVideoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocalVideo', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByPublishedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedTime', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByPublishedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedTime', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenBySuffix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suffix', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenBySuffixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suffix', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByUpdateDateFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDateFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy>
      thenByUpdateDateFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDateFormat', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByViewCountText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCountText', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByViewCountTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCountText', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByYoutubeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByYoutubeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeId', Sort.desc);
    });
  }
}

extension MediaInfoQueryWhereDistinct
    on QueryBuilder<MediaInfo, MediaInfo, QDistinct> {
  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByAssetsCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetsCreateDate');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByAssetsId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetsId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByAuthorThumbnail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorThumbnail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByByteSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'byteSize');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDate');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByCreateDateFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDateFormat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDirectoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'directoryId');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDirectoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'directoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDownloadPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadProgress');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadStatus');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByHistoryPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historyPosition');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByHistoryProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historyProgress');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByIdentify(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identify', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByIsDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDelete');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByIsLocalVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocalVideo');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct>
      distinctByLocalBytesThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localBytesThumbnail');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByPublishedTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishedTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceType');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctBySuffix(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suffix', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByThumbnail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDate');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByUpdateDateFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDateFormat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByViewCountText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewCountText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'width');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByYoutubeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'youtubeId', caseSensitive: caseSensitive);
    });
  }
}

extension MediaInfoQueryProperty
    on QueryBuilder<MediaInfo, MediaInfo, QQueryProperty> {
  QueryBuilder<MediaInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MediaInfo, int, QQueryOperations> assetsCreateDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetsCreateDate');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> assetsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetsId');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> authorThumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorThumbnail');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> byteSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'byteSize');
    });
  }

  QueryBuilder<MediaInfo, int, QQueryOperations> createDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDate');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> createDateFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDateFormat');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> directoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'directoryId');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> directoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'directoryName');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> downloadPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadPath');
    });
  }

  QueryBuilder<MediaInfo, double?, QQueryOperations>
      downloadProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadProgress');
    });
  }

  QueryBuilder<MediaInfo, DownloadStatus, QQueryOperations>
      downloadStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadStatus');
    });
  }

  QueryBuilder<MediaInfo, int, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> historyPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historyPosition');
    });
  }

  QueryBuilder<MediaInfo, double?, QQueryOperations> historyProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historyProgress');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> identifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identify');
    });
  }

  QueryBuilder<MediaInfo, bool, QQueryOperations> isDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDelete');
    });
  }

  QueryBuilder<MediaInfo, bool, QQueryOperations> isLocalVideoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocalVideo');
    });
  }

  QueryBuilder<MediaInfo, List<int>?, QQueryOperations>
      localBytesThumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localBytesThumbnail');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<MediaInfo, PlayHistory?, QQueryOperations>
      playHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playHistory');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> publishedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishedTime');
    });
  }

  QueryBuilder<MediaInfo, SourceType, QQueryOperations> sourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceType');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> suffixProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suffix');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> thumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnail');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<MediaInfo, int, QQueryOperations> updateDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDate');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> updateDateFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDateFormat');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> viewCountTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewCountText');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> widthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'width');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> youtubeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'youtubeId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayHistorySchema = Schema(
  name: r'PlayHistory',
  id: 6118132194974220027,
  properties: {
    r'firstPlayDate': PropertySchema(
      id: 0,
      name: r'firstPlayDate',
      type: IsarType.long,
    ),
    r'playPosition': PropertySchema(
      id: 1,
      name: r'playPosition',
      type: IsarType.long,
    ),
    r'recentPlayDate': PropertySchema(
      id: 2,
      name: r'recentPlayDate',
      type: IsarType.long,
    )
  },
  estimateSize: _playHistoryEstimateSize,
  serialize: _playHistorySerialize,
  deserialize: _playHistoryDeserialize,
  deserializeProp: _playHistoryDeserializeProp,
);

int _playHistoryEstimateSize(
  PlayHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _playHistorySerialize(
  PlayHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.firstPlayDate);
  writer.writeLong(offsets[1], object.playPosition);
  writer.writeLong(offsets[2], object.recentPlayDate);
}

PlayHistory _playHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayHistory(
    firstPlayDate: reader.readLongOrNull(offsets[0]),
    playPosition: reader.readLongOrNull(offsets[1]),
    recentPlayDate: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _playHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayHistoryQueryFilter
    on QueryBuilder<PlayHistory, PlayHistory, QFilterCondition> {
  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstPlayDate',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstPlayDate',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      firstPlayDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstPlayDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playPosition',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playPosition',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      playPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playPosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recentPlayDate',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recentPlayDate',
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recentPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recentPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recentPlayDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayHistory, PlayHistory, QAfterFilterCondition>
      recentPlayDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recentPlayDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlayHistoryQueryObject
    on QueryBuilder<PlayHistory, PlayHistory, QFilterCondition> {}
