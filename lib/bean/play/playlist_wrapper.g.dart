// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_wrapper.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlaylistWrapperCollection on Isar {
  IsarCollection<PlaylistWrapper> get playlistWrappers => this.collection();
}

const PlaylistWrapperSchema = CollectionSchema(
  name: r'PlaylistWrapper',
  id: 7761086640435427245,
  properties: {
    r'createDate': PropertySchema(
      id: 0,
      name: r'createDate',
      type: IsarType.long,
    ),
    r'mediaId': PropertySchema(
      id: 1,
      name: r'mediaId',
      type: IsarType.long,
    ),
    r'playlistId': PropertySchema(
      id: 2,
      name: r'playlistId',
      type: IsarType.long,
    ),
    r'updateDate': PropertySchema(
      id: 3,
      name: r'updateDate',
      type: IsarType.long,
    )
  },
  estimateSize: _playlistWrapperEstimateSize,
  serialize: _playlistWrapperSerialize,
  deserialize: _playlistWrapperDeserialize,
  deserializeProp: _playlistWrapperDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _playlistWrapperGetId,
  getLinks: _playlistWrapperGetLinks,
  attach: _playlistWrapperAttach,
  version: '3.1.0+1',
);

int _playlistWrapperEstimateSize(
  PlaylistWrapper object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _playlistWrapperSerialize(
  PlaylistWrapper object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createDate);
  writer.writeLong(offsets[1], object.mediaId);
  writer.writeLong(offsets[2], object.playlistId);
  writer.writeLong(offsets[3], object.updateDate);
}

PlaylistWrapper _playlistWrapperDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlaylistWrapper();
  object.createDate = reader.readLong(offsets[0]);
  object.id = id;
  object.mediaId = reader.readLong(offsets[1]);
  object.playlistId = reader.readLong(offsets[2]);
  object.updateDate = reader.readLong(offsets[3]);
  return object;
}

P _playlistWrapperDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playlistWrapperGetId(PlaylistWrapper object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playlistWrapperGetLinks(PlaylistWrapper object) {
  return [];
}

void _playlistWrapperAttach(
    IsarCollection<dynamic> col, Id id, PlaylistWrapper object) {
  object.id = id;
}

extension PlaylistWrapperQueryWhereSort
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QWhere> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlaylistWrapperQueryWhere
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QWhereClause> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterWhereClause> idBetween(
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

extension PlaylistWrapperQueryFilter
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QFilterCondition> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      createDateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      createDateLessThan(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      createDateBetween(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      mediaIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      mediaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      mediaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      mediaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      playlistIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      playlistIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playlistId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      playlistIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playlistId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      playlistIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playlistId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      updateDateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      updateDateLessThan(
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

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterFilterCondition>
      updateDateBetween(
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
}

extension PlaylistWrapperQueryObject
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QFilterCondition> {}

extension PlaylistWrapperQueryLinks
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QFilterCondition> {}

extension PlaylistWrapperQuerySortBy
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QSortBy> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy> sortByMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      sortByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.desc);
    });
  }
}

extension PlaylistWrapperQuerySortThenBy
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QSortThenBy> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy> thenByMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.asc);
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QAfterSortBy>
      thenByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDate', Sort.desc);
    });
  }
}

extension PlaylistWrapperQueryWhereDistinct
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QDistinct> {
  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QDistinct>
      distinctByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDate');
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QDistinct>
      distinctByMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaId');
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QDistinct>
      distinctByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistId');
    });
  }

  QueryBuilder<PlaylistWrapper, PlaylistWrapper, QDistinct>
      distinctByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDate');
    });
  }
}

extension PlaylistWrapperQueryProperty
    on QueryBuilder<PlaylistWrapper, PlaylistWrapper, QQueryProperty> {
  QueryBuilder<PlaylistWrapper, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlaylistWrapper, int, QQueryOperations> createDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDate');
    });
  }

  QueryBuilder<PlaylistWrapper, int, QQueryOperations> mediaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaId');
    });
  }

  QueryBuilder<PlaylistWrapper, int, QQueryOperations> playlistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistId');
    });
  }

  QueryBuilder<PlaylistWrapper, int, QQueryOperations> updateDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDate');
    });
  }
}
