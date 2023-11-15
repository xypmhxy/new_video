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
    r'audioSources': PropertySchema(
      id: 2,
      name: r'audioSources',
      type: IsarType.objectList,
      target: r'AudioSource',
    ),
    r'author': PropertySchema(
      id: 3,
      name: r'author',
      type: IsarType.string,
    ),
    r'authorId': PropertySchema(
      id: 4,
      name: r'authorId',
      type: IsarType.string,
    ),
    r'authorThumbnail': PropertySchema(
      id: 5,
      name: r'authorThumbnail',
      type: IsarType.string,
    ),
    r'byteSize': PropertySchema(
      id: 6,
      name: r'byteSize',
      type: IsarType.long,
    ),
    r'createDate': PropertySchema(
      id: 7,
      name: r'createDate',
      type: IsarType.long,
    ),
    r'createDateFormat': PropertySchema(
      id: 8,
      name: r'createDateFormat',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 9,
      name: r'description',
      type: IsarType.string,
    ),
    r'directoryId': PropertySchema(
      id: 10,
      name: r'directoryId',
      type: IsarType.long,
    ),
    r'directoryName': PropertySchema(
      id: 11,
      name: r'directoryName',
      type: IsarType.string,
    ),
    r'dislikeCount': PropertySchema(
      id: 12,
      name: r'dislikeCount',
      type: IsarType.long,
    ),
    r'duration': PropertySchema(
      id: 13,
      name: r'duration',
      type: IsarType.long,
    ),
    r'durationFormat': PropertySchema(
      id: 14,
      name: r'durationFormat',
      type: IsarType.string,
    ),
    r'height': PropertySchema(
      id: 15,
      name: r'height',
      type: IsarType.long,
    ),
    r'historyPosition': PropertySchema(
      id: 16,
      name: r'historyPosition',
      type: IsarType.long,
    ),
    r'historyProgress': PropertySchema(
      id: 17,
      name: r'historyProgress',
      type: IsarType.double,
    ),
    r'identify': PropertySchema(
      id: 18,
      name: r'identify',
      type: IsarType.string,
    ),
    r'isDelete': PropertySchema(
      id: 19,
      name: r'isDelete',
      type: IsarType.bool,
    ),
    r'isLike': PropertySchema(
      id: 20,
      name: r'isLike',
      type: IsarType.bool,
    ),
    r'isLocalVideo': PropertySchema(
      id: 21,
      name: r'isLocalVideo',
      type: IsarType.bool,
    ),
    r'likeCount': PropertySchema(
      id: 22,
      name: r'likeCount',
      type: IsarType.long,
    ),
    r'localBytesThumbnail': PropertySchema(
      id: 23,
      name: r'localBytesThumbnail',
      type: IsarType.byteList,
    ),
    r'localPath': PropertySchema(
      id: 24,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'playHistory': PropertySchema(
      id: 25,
      name: r'playHistory',
      type: IsarType.object,
      target: r'PlayHistory',
    ),
    r'publishedTime': PropertySchema(
      id: 26,
      name: r'publishedTime',
      type: IsarType.string,
    ),
    r'sourceType': PropertySchema(
      id: 27,
      name: r'sourceType',
      type: IsarType.byte,
      enumMap: _MediaInfosourceTypeEnumValueMap,
    ),
    r'suffix': PropertySchema(
      id: 28,
      name: r'suffix',
      type: IsarType.string,
    ),
    r'thumbnail': PropertySchema(
      id: 29,
      name: r'thumbnail',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 30,
      name: r'title',
      type: IsarType.string,
    ),
    r'updateDate': PropertySchema(
      id: 31,
      name: r'updateDate',
      type: IsarType.long,
    ),
    r'updateDateFormat': PropertySchema(
      id: 32,
      name: r'updateDateFormat',
      type: IsarType.string,
    ),
    r'videoSources': PropertySchema(
      id: 33,
      name: r'videoSources',
      type: IsarType.objectList,
      target: r'VideoSource',
    ),
    r'viewCountText': PropertySchema(
      id: 34,
      name: r'viewCountText',
      type: IsarType.string,
    ),
    r'width': PropertySchema(
      id: 35,
      name: r'width',
      type: IsarType.long,
    ),
    r'youtubeId': PropertySchema(
      id: 36,
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
  embeddedSchemas: {
    r'PlayHistory': PlayHistorySchema,
    r'VideoSource': VideoSourceSchema,
    r'AudioSource': AudioSourceSchema
  },
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
  {
    final list = object.audioSources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AudioSource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AudioSourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.author.length * 3;
  {
    final value = object.authorId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  bytesCount += 3 + object.durationFormat.length * 3;
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
    final list = object.videoSources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VideoSource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VideoSourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
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
  writer.writeObjectList<AudioSource>(
    offsets[2],
    allOffsets,
    AudioSourceSchema.serialize,
    object.audioSources,
  );
  writer.writeString(offsets[3], object.author);
  writer.writeString(offsets[4], object.authorId);
  writer.writeString(offsets[5], object.authorThumbnail);
  writer.writeLong(offsets[6], object.byteSize);
  writer.writeLong(offsets[7], object.createDate);
  writer.writeString(offsets[8], object.createDateFormat);
  writer.writeString(offsets[9], object.description);
  writer.writeLong(offsets[10], object.directoryId);
  writer.writeString(offsets[11], object.directoryName);
  writer.writeLong(offsets[12], object.dislikeCount);
  writer.writeLong(offsets[13], object.duration);
  writer.writeString(offsets[14], object.durationFormat);
  writer.writeLong(offsets[15], object.height);
  writer.writeLong(offsets[16], object.historyPosition);
  writer.writeDouble(offsets[17], object.historyProgress);
  writer.writeString(offsets[18], object.identify);
  writer.writeBool(offsets[19], object.isDelete);
  writer.writeBool(offsets[20], object.isLike);
  writer.writeBool(offsets[21], object.isLocalVideo);
  writer.writeLong(offsets[22], object.likeCount);
  writer.writeByteList(offsets[23], object.localBytesThumbnail);
  writer.writeString(offsets[24], object.localPath);
  writer.writeObject<PlayHistory>(
    offsets[25],
    allOffsets,
    PlayHistorySchema.serialize,
    object.playHistory,
  );
  writer.writeString(offsets[26], object.publishedTime);
  writer.writeByte(offsets[27], object.sourceType.index);
  writer.writeString(offsets[28], object.suffix);
  writer.writeString(offsets[29], object.thumbnail);
  writer.writeString(offsets[30], object.title);
  writer.writeLong(offsets[31], object.updateDate);
  writer.writeString(offsets[32], object.updateDateFormat);
  writer.writeObjectList<VideoSource>(
    offsets[33],
    allOffsets,
    VideoSourceSchema.serialize,
    object.videoSources,
  );
  writer.writeString(offsets[34], object.viewCountText);
  writer.writeLong(offsets[35], object.width);
  writer.writeString(offsets[36], object.youtubeId);
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
  object.audioSources = reader.readObjectList<AudioSource>(
    offsets[2],
    AudioSourceSchema.deserialize,
    allOffsets,
    AudioSource(),
  );
  object.author = reader.readString(offsets[3]);
  object.authorId = reader.readStringOrNull(offsets[4]);
  object.authorThumbnail = reader.readStringOrNull(offsets[5]);
  object.byteSize = reader.readLongOrNull(offsets[6]);
  object.createDate = reader.readLong(offsets[7]);
  object.description = reader.readStringOrNull(offsets[9]);
  object.directoryId = reader.readLongOrNull(offsets[10]);
  object.directoryName = reader.readStringOrNull(offsets[11]);
  object.dislikeCount = reader.readLongOrNull(offsets[12]);
  object.duration = reader.readLong(offsets[13]);
  object.height = reader.readLongOrNull(offsets[15]);
  object.id = id;
  object.isDelete = reader.readBool(offsets[19]);
  object.isLike = reader.readBool(offsets[20]);
  object.likeCount = reader.readLongOrNull(offsets[22]);
  object.localBytesThumbnail = reader.readByteList(offsets[23]);
  object.localPath = reader.readStringOrNull(offsets[24]);
  object.playHistory = reader.readObjectOrNull<PlayHistory>(
    offsets[25],
    PlayHistorySchema.deserialize,
    allOffsets,
  );
  object.publishedTime = reader.readStringOrNull(offsets[26]);
  object.sourceType =
      _MediaInfosourceTypeValueEnumMap[reader.readByteOrNull(offsets[27])] ??
          SourceType.local;
  object.suffix = reader.readString(offsets[28]);
  object.thumbnail = reader.readStringOrNull(offsets[29]);
  object.title = reader.readString(offsets[30]);
  object.updateDate = reader.readLong(offsets[31]);
  object.videoSources = reader.readObjectList<VideoSource>(
    offsets[33],
    VideoSourceSchema.deserialize,
    allOffsets,
    VideoSource(),
  );
  object.viewCountText = reader.readStringOrNull(offsets[34]);
  object.width = reader.readLongOrNull(offsets[35]);
  object.youtubeId = reader.readStringOrNull(offsets[36]);
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
      return (reader.readObjectList<AudioSource>(
        offset,
        AudioSourceSchema.deserialize,
        allOffsets,
        AudioSource(),
      )) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readBool(offset)) as P;
    case 21:
      return (reader.readBool(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readByteList(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readObjectOrNull<PlayHistory>(
        offset,
        PlayHistorySchema.deserialize,
        allOffsets,
      )) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (_MediaInfosourceTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          SourceType.local) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readLong(offset)) as P;
    case 32:
      return (reader.readString(offset)) as P;
    case 33:
      return (reader.readObjectList<VideoSource>(
        offset,
        VideoSourceSchema.deserialize,
        allOffsets,
        VideoSource(),
      )) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readLongOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MediaInfosourceTypeEnumValueMap = {
  'local': 0,
  'youtube': 1,
  'bilibili': 2,
};
const _MediaInfosourceTypeValueEnumMap = {
  0: SourceType.local,
  1: SourceType.youtube,
  2: SourceType.bilibili,
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioSources',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioSources',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      audioSourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioSources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorId',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> authorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      authorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorId',
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
      dislikeCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dislikeCount',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      dislikeCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dislikeCount',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> dislikeCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dislikeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      dislikeCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dislikeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      dislikeCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dislikeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> dislikeCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dislikeCount',
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'durationFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'durationFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      durationFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'durationFormat',
        value: '',
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> isLikeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLike',
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> likeCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'likeCount',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      likeCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'likeCount',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> likeCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      likeCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> likeCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> likeCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likeCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      videoSourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'videoSources',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'videoSources',
      ));
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition>
      videoSourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoSources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> audioSourcesElement(
      FilterQuery<AudioSource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'audioSources');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> playHistory(
      FilterQuery<PlayHistory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'playHistory');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterFilterCondition> videoSourcesElement(
      FilterQuery<VideoSource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'videoSources');
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDislikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikeCount', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDislikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikeCount', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDurationFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByDurationFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormat', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLike', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByIsLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLike', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> sortByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDislikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikeCount', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDislikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikeCount', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDurationFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormat', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByDurationFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormat', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLike', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByIsLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLike', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.asc);
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QAfterSortBy> thenByLikeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likeCount', Sort.desc);
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

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByAuthorId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorId', caseSensitive: caseSensitive);
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

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDislikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dislikeCount');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByDurationFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationFormat',
          caseSensitive: caseSensitive);
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

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByIsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLike');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByIsLocalVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocalVideo');
    });
  }

  QueryBuilder<MediaInfo, MediaInfo, QDistinct> distinctByLikeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likeCount');
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

  QueryBuilder<MediaInfo, List<AudioSource>?, QQueryOperations>
      audioSourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioSources');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<MediaInfo, String?, QQueryOperations> authorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorId');
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

  QueryBuilder<MediaInfo, int?, QQueryOperations> dislikeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dislikeCount');
    });
  }

  QueryBuilder<MediaInfo, int, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<MediaInfo, String, QQueryOperations> durationFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationFormat');
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

  QueryBuilder<MediaInfo, bool, QQueryOperations> isLikeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLike');
    });
  }

  QueryBuilder<MediaInfo, bool, QQueryOperations> isLocalVideoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocalVideo');
    });
  }

  QueryBuilder<MediaInfo, int?, QQueryOperations> likeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likeCount');
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

  QueryBuilder<MediaInfo, List<VideoSource>?, QQueryOperations>
      videoSourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoSources');
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

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VideoSourceSchema = Schema(
  name: r'VideoSource',
  id: 7682483451518015526,
  properties: {
    r'bitrate': PropertySchema(
      id: 0,
      name: r'bitrate',
      type: IsarType.long,
    ),
    r'byteSize': PropertySchema(
      id: 1,
      name: r'byteSize',
      type: IsarType.long,
    ),
    r'downloadFinishDate': PropertySchema(
      id: 2,
      name: r'downloadFinishDate',
      type: IsarType.long,
    ),
    r'downloadLength': PropertySchema(
      id: 3,
      name: r'downloadLength',
      type: IsarType.long,
    ),
    r'downloadPath': PropertySchema(
      id: 4,
      name: r'downloadPath',
      type: IsarType.string,
    ),
    r'downloadProgress': PropertySchema(
      id: 5,
      name: r'downloadProgress',
      type: IsarType.double,
    ),
    r'downloadStartDate': PropertySchema(
      id: 6,
      name: r'downloadStartDate',
      type: IsarType.long,
    ),
    r'downloadStatus': PropertySchema(
      id: 7,
      name: r'downloadStatus',
      type: IsarType.byte,
      enumMap: _VideoSourcedownloadStatusEnumValueMap,
    ),
    r'fileLength': PropertySchema(
      id: 8,
      name: r'fileLength',
      type: IsarType.long,
    ),
    r'format': PropertySchema(
      id: 9,
      name: r'format',
      type: IsarType.string,
    ),
    r'fps': PropertySchema(
      id: 10,
      name: r'fps',
      type: IsarType.long,
    ),
    r'height': PropertySchema(
      id: 11,
      name: r'height',
      type: IsarType.long,
    ),
    r'isOnlyVideo': PropertySchema(
      id: 12,
      name: r'isOnlyVideo',
      type: IsarType.bool,
    ),
    r'isWaiting': PropertySchema(
      id: 13,
      name: r'isWaiting',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 14,
      name: r'label',
      type: IsarType.string,
    ),
    r'resolution': PropertySchema(
      id: 15,
      name: r'resolution',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 16,
      name: r'url',
      type: IsarType.string,
    ),
    r'width': PropertySchema(
      id: 17,
      name: r'width',
      type: IsarType.long,
    )
  },
  estimateSize: _videoSourceEstimateSize,
  serialize: _videoSourceSerialize,
  deserialize: _videoSourceDeserialize,
  deserializeProp: _videoSourceDeserializeProp,
);

int _videoSourceEstimateSize(
  VideoSource object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.downloadPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.format;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.resolution.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _videoSourceSerialize(
  VideoSource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bitrate);
  writer.writeLong(offsets[1], object.byteSize);
  writer.writeLong(offsets[2], object.downloadFinishDate);
  writer.writeLong(offsets[3], object.downloadLength);
  writer.writeString(offsets[4], object.downloadPath);
  writer.writeDouble(offsets[5], object.downloadProgress);
  writer.writeLong(offsets[6], object.downloadStartDate);
  writer.writeByte(offsets[7], object.downloadStatus.index);
  writer.writeLong(offsets[8], object.fileLength);
  writer.writeString(offsets[9], object.format);
  writer.writeLong(offsets[10], object.fps);
  writer.writeLong(offsets[11], object.height);
  writer.writeBool(offsets[12], object.isOnlyVideo);
  writer.writeBool(offsets[13], object.isWaiting);
  writer.writeString(offsets[14], object.label);
  writer.writeString(offsets[15], object.resolution);
  writer.writeString(offsets[16], object.url);
  writer.writeLong(offsets[17], object.width);
}

VideoSource _videoSourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoSource(
    bitrate: reader.readLongOrNull(offsets[0]),
    byteSize: reader.readLongOrNull(offsets[1]),
    format: reader.readStringOrNull(offsets[9]),
    fps: reader.readLongOrNull(offsets[10]),
    height: reader.readLongOrNull(offsets[11]),
    isOnlyVideo: reader.readBoolOrNull(offsets[12]) ?? false,
    label: reader.readStringOrNull(offsets[14]),
    url: reader.readStringOrNull(offsets[16]) ?? '',
    width: reader.readLongOrNull(offsets[17]),
  );
  object.downloadFinishDate = reader.readLongOrNull(offsets[2]);
  object.downloadLength = reader.readLongOrNull(offsets[3]);
  object.downloadPath = reader.readStringOrNull(offsets[4]);
  object.downloadStartDate = reader.readLongOrNull(offsets[6]);
  object.downloadStatus = _VideoSourcedownloadStatusValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      DownloadStatus.none;
  object.fileLength = reader.readLongOrNull(offsets[8]);
  return object;
}

P _videoSourceDeserializeProp<P>(
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
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (_VideoSourcedownloadStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DownloadStatus.none) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoSourcedownloadStatusEnumValueMap = {
  'none': 0,
  'waiting': 1,
  'downloading': 2,
  'pause': 3,
  'success': 4,
  'failed': 5,
};
const _VideoSourcedownloadStatusValueEnumMap = {
  0: DownloadStatus.none,
  1: DownloadStatus.waiting,
  2: DownloadStatus.downloading,
  3: DownloadStatus.pause,
  4: DownloadStatus.success,
  5: DownloadStatus.failed,
};

extension VideoSourceQueryFilter
    on QueryBuilder<VideoSource, VideoSource, QFilterCondition> {
  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      bitrateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      bitrateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> bitrateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      bitrateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> bitrateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> bitrateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bitrate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      byteSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      byteSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> byteSizeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byteSize',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      byteSizeGreaterThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      byteSizeLessThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> byteSizeBetween(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadFinishDate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadFinishDate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadFinishDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadFinishDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadLength',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadLength',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathEqualTo(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathBetween(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadProgressEqualTo(
    double value, {
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double value, {
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadProgressLessThan(
    double value, {
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadProgressBetween(
    double lower,
    double upper, {
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadStartDate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadStartDate',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStartDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      downloadStatusEqualTo(DownloadStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileLength',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileLength',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      fileLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'format',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      formatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'format',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      formatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'format',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      formatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> formatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'format',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      formatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      formatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fps',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fps',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fps',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fps',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fps',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> fpsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> heightEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      heightGreaterThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> heightLessThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> heightBetween(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      isOnlyVideoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnlyVideo',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      isWaitingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWaiting',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolution',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resolution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resolution',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolution',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      resolutionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resolution',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> widthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      widthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> widthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition>
      widthGreaterThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> widthLessThan(
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

  QueryBuilder<VideoSource, VideoSource, QAfterFilterCondition> widthBetween(
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
}

extension VideoSourceQueryObject
    on QueryBuilder<VideoSource, VideoSource, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AudioSourceSchema = Schema(
  name: r'AudioSource',
  id: -6394188906617519483,
  properties: {
    r'bitrate': PropertySchema(
      id: 0,
      name: r'bitrate',
      type: IsarType.long,
    ),
    r'byteSize': PropertySchema(
      id: 1,
      name: r'byteSize',
      type: IsarType.long,
    ),
    r'downloadFinishDate': PropertySchema(
      id: 2,
      name: r'downloadFinishDate',
      type: IsarType.long,
    ),
    r'downloadLength': PropertySchema(
      id: 3,
      name: r'downloadLength',
      type: IsarType.long,
    ),
    r'downloadPath': PropertySchema(
      id: 4,
      name: r'downloadPath',
      type: IsarType.string,
    ),
    r'downloadProgress': PropertySchema(
      id: 5,
      name: r'downloadProgress',
      type: IsarType.double,
    ),
    r'downloadStartDate': PropertySchema(
      id: 6,
      name: r'downloadStartDate',
      type: IsarType.long,
    ),
    r'downloadStatus': PropertySchema(
      id: 7,
      name: r'downloadStatus',
      type: IsarType.byte,
      enumMap: _AudioSourcedownloadStatusEnumValueMap,
    ),
    r'fileLength': PropertySchema(
      id: 8,
      name: r'fileLength',
      type: IsarType.long,
    ),
    r'format': PropertySchema(
      id: 9,
      name: r'format',
      type: IsarType.string,
    ),
    r'isWaiting': PropertySchema(
      id: 10,
      name: r'isWaiting',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 11,
      name: r'label',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 12,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _audioSourceEstimateSize,
  serialize: _audioSourceSerialize,
  deserialize: _audioSourceDeserialize,
  deserializeProp: _audioSourceDeserializeProp,
);

int _audioSourceEstimateSize(
  AudioSource object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.downloadPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.format;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _audioSourceSerialize(
  AudioSource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bitrate);
  writer.writeLong(offsets[1], object.byteSize);
  writer.writeLong(offsets[2], object.downloadFinishDate);
  writer.writeLong(offsets[3], object.downloadLength);
  writer.writeString(offsets[4], object.downloadPath);
  writer.writeDouble(offsets[5], object.downloadProgress);
  writer.writeLong(offsets[6], object.downloadStartDate);
  writer.writeByte(offsets[7], object.downloadStatus.index);
  writer.writeLong(offsets[8], object.fileLength);
  writer.writeString(offsets[9], object.format);
  writer.writeBool(offsets[10], object.isWaiting);
  writer.writeString(offsets[11], object.label);
  writer.writeString(offsets[12], object.url);
}

AudioSource _audioSourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioSource(
    bitrate: reader.readLongOrNull(offsets[0]),
    byteSize: reader.readLongOrNull(offsets[1]),
    format: reader.readStringOrNull(offsets[9]),
    label: reader.readStringOrNull(offsets[11]),
    url: reader.readStringOrNull(offsets[12]) ?? '',
  );
  object.downloadFinishDate = reader.readLongOrNull(offsets[2]);
  object.downloadLength = reader.readLongOrNull(offsets[3]);
  object.downloadPath = reader.readStringOrNull(offsets[4]);
  object.downloadStartDate = reader.readLongOrNull(offsets[6]);
  object.downloadStatus = _AudioSourcedownloadStatusValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      DownloadStatus.none;
  object.fileLength = reader.readLongOrNull(offsets[8]);
  return object;
}

P _audioSourceDeserializeProp<P>(
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
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (_AudioSourcedownloadStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DownloadStatus.none) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AudioSourcedownloadStatusEnumValueMap = {
  'none': 0,
  'waiting': 1,
  'downloading': 2,
  'pause': 3,
  'success': 4,
  'failed': 5,
};
const _AudioSourcedownloadStatusValueEnumMap = {
  0: DownloadStatus.none,
  1: DownloadStatus.waiting,
  2: DownloadStatus.downloading,
  3: DownloadStatus.pause,
  4: DownloadStatus.success,
  5: DownloadStatus.failed,
};

extension AudioSourceQueryFilter
    on QueryBuilder<AudioSource, AudioSource, QFilterCondition> {
  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      bitrateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      bitrateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> bitrateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      bitrateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> bitrateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> bitrateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bitrate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      byteSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      byteSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'byteSize',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> byteSizeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byteSize',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      byteSizeGreaterThan(
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      byteSizeLessThan(
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> byteSizeBetween(
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadFinishDate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadFinishDate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadFinishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadFinishDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadFinishDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadLength',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadLength',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadPath',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathEqualTo(
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathBetween(
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadPath',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadProgressEqualTo(
    double value, {
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double value, {
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadProgressLessThan(
    double value, {
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadProgressBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadStartDate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadStartDate',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStartDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      downloadStatusEqualTo(DownloadStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
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

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileLength',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileLength',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileLength',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      fileLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'format',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      formatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'format',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      formatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'format',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      formatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> formatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'format',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      formatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      formatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      isWaitingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWaiting',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSource, AudioSource, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension AudioSourceQueryObject
    on QueryBuilder<AudioSource, AudioSource, QFilterCondition> {}
