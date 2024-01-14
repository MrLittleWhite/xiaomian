// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_text.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LanguageTextSchema = Schema(
  name: r'LanguageText',
  id: 8281792948050675122,
  properties: {
    r'cn': PropertySchema(
      id: 0,
      name: r'cn',
      type: IsarType.string,
    ),
    r'cnHK': PropertySchema(
      id: 1,
      name: r'cnHK',
      type: IsarType.string,
    ),
    r'en': PropertySchema(
      id: 2,
      name: r'en',
      type: IsarType.string,
    ),
    r'ja': PropertySchema(
      id: 3,
      name: r'ja',
      type: IsarType.string,
    ),
    r'ko': PropertySchema(
      id: 4,
      name: r'ko',
      type: IsarType.string,
    )
  },
  estimateSize: _languageTextEstimateSize,
  serialize: _languageTextSerialize,
  deserialize: _languageTextDeserialize,
  deserializeProp: _languageTextDeserializeProp,
);

int _languageTextEstimateSize(
  LanguageText object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cnHK;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.en;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ja;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ko;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _languageTextSerialize(
  LanguageText object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cn);
  writer.writeString(offsets[1], object.cnHK);
  writer.writeString(offsets[2], object.en);
  writer.writeString(offsets[3], object.ja);
  writer.writeString(offsets[4], object.ko);
}

LanguageText _languageTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LanguageText(
    cn: reader.readStringOrNull(offsets[0]),
    cnHK: reader.readStringOrNull(offsets[1]),
    en: reader.readStringOrNull(offsets[2]),
    ja: reader.readStringOrNull(offsets[3]),
    ko: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _languageTextDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LanguageTextQueryFilter
    on QueryBuilder<LanguageText, LanguageText, QFilterCondition> {
  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cn',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cn',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cn',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cn',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cnHK',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnHKIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cnHK',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnHKGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cnHK',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnHKStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cnHK',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> cnHKMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cnHK',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnHKIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnHK',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      cnHKIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cnHK',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      enIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'en',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'en',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'en',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'en',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> enIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      enIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'en',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ja',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      jaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ja',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ja',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ja',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ja',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> jaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ja',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      jaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ja',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ko',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      koIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ko',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ko',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ko',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ko',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition> koIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ko',
        value: '',
      ));
    });
  }

  QueryBuilder<LanguageText, LanguageText, QAfterFilterCondition>
      koIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ko',
        value: '',
      ));
    });
  }
}

extension LanguageTextQueryObject
    on QueryBuilder<LanguageText, LanguageText, QFilterCondition> {}
