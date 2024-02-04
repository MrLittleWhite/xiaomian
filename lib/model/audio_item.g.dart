// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAudioItemCollection on Isar {
  IsarCollection<AudioItem> get audioItems => this.collection();
}

const AudioItemSchema = CollectionSchema(
  name: r'AudioItem',
  id: -1907056743646547546,
  properties: {
    r'aId': PropertySchema(
      id: 0,
      name: r'aId',
      type: IsarType.string,
    ),
    r'author': PropertySchema(
      id: 1,
      name: r'author',
      type: IsarType.object,
      target: r'XMUser',
    ),
    r'authorName': PropertySchema(
      id: 2,
      name: r'authorName',
      type: IsarType.string,
    ),
    r'cover': PropertySchema(
      id: 3,
      name: r'cover',
      type: IsarType.string,
    ),
    r'createTime': PropertySchema(
      id: 4,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'desc': PropertySchema(
      id: 5,
      name: r'desc',
      type: IsarType.string,
    ),
    r'descTXT': PropertySchema(
      id: 6,
      name: r'descTXT',
      type: IsarType.object,
      target: r'LanguageText',
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'titleTXT': PropertySchema(
      id: 8,
      name: r'titleTXT',
      type: IsarType.object,
      target: r'LanguageText',
    ),
    r'url': PropertySchema(
      id: 9,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _audioItemEstimateSize,
  serialize: _audioItemSerialize,
  deserialize: _audioItemDeserialize,
  deserializeProp: _audioItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'aId': IndexSchema(
      id: 1517419860502881383,
      name: r'aId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'aId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createTime': IndexSchema(
      id: -7085130145048818916,
      name: r'createTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'LanguageText': LanguageTextSchema,
    r'XMUser': XMUserSchema
  },
  getId: _audioItemGetId,
  getLinks: _audioItemGetLinks,
  attach: _audioItemAttach,
  version: '3.1.0+1',
);

int _audioItemEstimateSize(
  AudioItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aId.length * 3;
  {
    final value = object.author;
    if (value != null) {
      bytesCount +=
          3 + XMUserSchema.estimateSize(value, allOffsets[XMUser]!, allOffsets);
    }
  }
  {
    final value = object.authorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.desc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descTXT;
    if (value != null) {
      bytesCount += 3 +
          LanguageTextSchema.estimateSize(
              value, allOffsets[LanguageText]!, allOffsets);
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.titleTXT;
    if (value != null) {
      bytesCount += 3 +
          LanguageTextSchema.estimateSize(
              value, allOffsets[LanguageText]!, allOffsets);
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _audioItemSerialize(
  AudioItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aId);
  writer.writeObject<XMUser>(
    offsets[1],
    allOffsets,
    XMUserSchema.serialize,
    object.author,
  );
  writer.writeString(offsets[2], object.authorName);
  writer.writeString(offsets[3], object.cover);
  writer.writeDateTime(offsets[4], object.createTime);
  writer.writeString(offsets[5], object.desc);
  writer.writeObject<LanguageText>(
    offsets[6],
    allOffsets,
    LanguageTextSchema.serialize,
    object.descTXT,
  );
  writer.writeString(offsets[7], object.title);
  writer.writeObject<LanguageText>(
    offsets[8],
    allOffsets,
    LanguageTextSchema.serialize,
    object.titleTXT,
  );
  writer.writeString(offsets[9], object.url);
}

AudioItem _audioItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioItem(
    aId: reader.readString(offsets[0]),
    author: reader.readObjectOrNull<XMUser>(
      offsets[1],
      XMUserSchema.deserialize,
      allOffsets,
    ),
    cover: reader.readStringOrNull(offsets[3]),
    createTime: reader.readDateTimeOrNull(offsets[4]),
    descTXT: reader.readObjectOrNull<LanguageText>(
      offsets[6],
      LanguageTextSchema.deserialize,
      allOffsets,
    ),
    titleTXT: reader.readObjectOrNull<LanguageText>(
      offsets[8],
      LanguageTextSchema.deserialize,
      allOffsets,
    ),
    url: reader.readStringOrNull(offsets[9]),
  );
  object.id = id;
  return object;
}

P _audioItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<XMUser>(
        offset,
        XMUserSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<LanguageText>(
        offset,
        LanguageTextSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<LanguageText>(
        offset,
        LanguageTextSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _audioItemGetId(AudioItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _audioItemGetLinks(AudioItem object) {
  return [];
}

void _audioItemAttach(IsarCollection<dynamic> col, Id id, AudioItem object) {
  object.id = id;
}

extension AudioItemByIndex on IsarCollection<AudioItem> {
  Future<AudioItem?> getByAId(String aId) {
    return getByIndex(r'aId', [aId]);
  }

  AudioItem? getByAIdSync(String aId) {
    return getByIndexSync(r'aId', [aId]);
  }

  Future<bool> deleteByAId(String aId) {
    return deleteByIndex(r'aId', [aId]);
  }

  bool deleteByAIdSync(String aId) {
    return deleteByIndexSync(r'aId', [aId]);
  }

  Future<List<AudioItem?>> getAllByAId(List<String> aIdValues) {
    final values = aIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'aId', values);
  }

  List<AudioItem?> getAllByAIdSync(List<String> aIdValues) {
    final values = aIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'aId', values);
  }

  Future<int> deleteAllByAId(List<String> aIdValues) {
    final values = aIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'aId', values);
  }

  int deleteAllByAIdSync(List<String> aIdValues) {
    final values = aIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'aId', values);
  }

  Future<Id> putByAId(AudioItem object) {
    return putByIndex(r'aId', object);
  }

  Id putByAIdSync(AudioItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'aId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAId(List<AudioItem> objects) {
    return putAllByIndex(r'aId', objects);
  }

  List<Id> putAllByAIdSync(List<AudioItem> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'aId', objects, saveLinks: saveLinks);
  }
}

extension AudioItemQueryWhereSort
    on QueryBuilder<AudioItem, AudioItem, QWhere> {
  QueryBuilder<AudioItem, AudioItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhere> anyCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createTime'),
      );
    });
  }
}

extension AudioItemQueryWhere
    on QueryBuilder<AudioItem, AudioItem, QWhereClause> {
  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> aIdEqualTo(String aId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'aId',
        value: [aId],
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> aIdNotEqualTo(
      String aId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aId',
              lower: [],
              upper: [aId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aId',
              lower: [aId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aId',
              lower: [aId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aId',
              lower: [],
              upper: [aId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeEqualTo(
      DateTime? createTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createTime',
        value: [createTime],
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeNotEqualTo(
      DateTime? createTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeGreaterThan(
    DateTime? createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [createTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeLessThan(
    DateTime? createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [],
        upper: [createTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterWhereClause> createTimeBetween(
    DateTime? lowerCreateTime,
    DateTime? upperCreateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [lowerCreateTime],
        includeLower: includeLower,
        upper: [upperCreateTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AudioItemQueryFilter
    on QueryBuilder<AudioItem, AudioItem, QFilterCondition> {
  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aId',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> aIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aId',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorName',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      authorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorName',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      authorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      authorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> authorNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      authorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      authorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> coverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> createTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      createTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> createTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      createTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> createTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> createTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descTXTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descTXT',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descTXTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descTXT',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleEqualTo(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleGreaterThan(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleLessThan(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleContains(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleTXTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'titleTXT',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition>
      titleTXTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'titleTXT',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlEqualTo(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlGreaterThan(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlLessThan(
    String? value, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlContains(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlMatches(
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

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension AudioItemQueryObject
    on QueryBuilder<AudioItem, AudioItem, QFilterCondition> {
  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> author(
      FilterQuery<XMUser> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'author');
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> descTXT(
      FilterQuery<LanguageText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descTXT');
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterFilterCondition> titleTXT(
      FilterQuery<LanguageText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'titleTXT');
    });
  }
}

extension AudioItemQueryLinks
    on QueryBuilder<AudioItem, AudioItem, QFilterCondition> {}

extension AudioItemQuerySortBy on QueryBuilder<AudioItem, AudioItem, QSortBy> {
  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByAId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aId', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByAIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aId', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByAuthorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorName', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByAuthorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorName', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension AudioItemQuerySortThenBy
    on QueryBuilder<AudioItem, AudioItem, QSortThenBy> {
  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByAId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aId', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByAIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aId', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByAuthorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorName', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByAuthorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorName', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension AudioItemQueryWhereDistinct
    on QueryBuilder<AudioItem, AudioItem, QDistinct> {
  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByAId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByAuthorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByCover(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioItem, AudioItem, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension AudioItemQueryProperty
    on QueryBuilder<AudioItem, AudioItem, QQueryProperty> {
  QueryBuilder<AudioItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AudioItem, String, QQueryOperations> aIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aId');
    });
  }

  QueryBuilder<AudioItem, XMUser?, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<AudioItem, String?, QQueryOperations> authorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorName');
    });
  }

  QueryBuilder<AudioItem, String?, QQueryOperations> coverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover');
    });
  }

  QueryBuilder<AudioItem, DateTime?, QQueryOperations> createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<AudioItem, String?, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<AudioItem, LanguageText?, QQueryOperations> descTXTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descTXT');
    });
  }

  QueryBuilder<AudioItem, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<AudioItem, LanguageText?, QQueryOperations> titleTXTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleTXT');
    });
  }

  QueryBuilder<AudioItem, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
