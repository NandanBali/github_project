// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetSearchQueryCollection on Isar {
  IsarCollection<int, SearchQuery> get searchQuerys => this.collection();
}

const SearchQuerySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'SearchQuery',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'searchQuery',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'queryType',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, SearchQuery>(
    serialize: serializeSearchQuery,
    deserialize: deserializeSearchQuery,
    deserializeProperty: deserializeSearchQueryProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeSearchQuery(IsarWriter writer, SearchQuery object) {
  IsarCore.writeString(writer, 1, object.searchQuery);
  IsarCore.writeString(writer, 2, object.queryType);
  return object.id;
}

@isarProtected
SearchQuery deserializeSearchQuery(IsarReader reader) {
  final object = SearchQuery();
  object.id = IsarCore.readId(reader);
  object.searchQuery = IsarCore.readString(reader, 1) ?? '';
  object.queryType = IsarCore.readString(reader, 2) ?? '';
  return object;
}

@isarProtected
dynamic deserializeSearchQueryProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _SearchQueryUpdate {
  bool call({
    required int id,
    String? searchQuery,
    String? queryType,
  });
}

class _SearchQueryUpdateImpl implements _SearchQueryUpdate {
  const _SearchQueryUpdateImpl(this.collection);

  final IsarCollection<int, SearchQuery> collection;

  @override
  bool call({
    required int id,
    Object? searchQuery = ignore,
    Object? queryType = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (searchQuery != ignore) 1: searchQuery as String?,
          if (queryType != ignore) 2: queryType as String?,
        }) >
        0;
  }
}

sealed class _SearchQueryUpdateAll {
  int call({
    required List<int> id,
    String? searchQuery,
    String? queryType,
  });
}

class _SearchQueryUpdateAllImpl implements _SearchQueryUpdateAll {
  const _SearchQueryUpdateAllImpl(this.collection);

  final IsarCollection<int, SearchQuery> collection;

  @override
  int call({
    required List<int> id,
    Object? searchQuery = ignore,
    Object? queryType = ignore,
  }) {
    return collection.updateProperties(id, {
      if (searchQuery != ignore) 1: searchQuery as String?,
      if (queryType != ignore) 2: queryType as String?,
    });
  }
}

extension SearchQueryUpdate on IsarCollection<int, SearchQuery> {
  _SearchQueryUpdate get update => _SearchQueryUpdateImpl(this);

  _SearchQueryUpdateAll get updateAll => _SearchQueryUpdateAllImpl(this);
}

sealed class _SearchQueryQueryUpdate {
  int call({
    String? searchQuery,
    String? queryType,
  });
}

class _SearchQueryQueryUpdateImpl implements _SearchQueryQueryUpdate {
  const _SearchQueryQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<SearchQuery> query;
  final int? limit;

  @override
  int call({
    Object? searchQuery = ignore,
    Object? queryType = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (searchQuery != ignore) 1: searchQuery as String?,
      if (queryType != ignore) 2: queryType as String?,
    });
  }
}

extension SearchQueryQueryUpdate on IsarQuery<SearchQuery> {
  _SearchQueryQueryUpdate get updateFirst =>
      _SearchQueryQueryUpdateImpl(this, limit: 1);

  _SearchQueryQueryUpdate get updateAll => _SearchQueryQueryUpdateImpl(this);
}

class _SearchQueryQueryBuilderUpdateImpl implements _SearchQueryQueryUpdate {
  const _SearchQueryQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<SearchQuery, SearchQuery, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? searchQuery = ignore,
    Object? queryType = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (searchQuery != ignore) 1: searchQuery as String?,
        if (queryType != ignore) 2: queryType as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension SearchQueryQueryBuilderUpdate
    on QueryBuilder<SearchQuery, SearchQuery, QOperations> {
  _SearchQueryQueryUpdate get updateFirst =>
      _SearchQueryQueryBuilderUpdateImpl(this, limit: 1);

  _SearchQueryQueryUpdate get updateAll =>
      _SearchQueryQueryBuilderUpdateImpl(this);
}

extension SearchQueryQueryFilter
    on QueryBuilder<SearchQuery, SearchQuery, QFilterCondition> {
  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      searchQueryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterFilterCondition>
      queryTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension SearchQueryQueryObject
    on QueryBuilder<SearchQuery, SearchQuery, QFilterCondition> {}

extension SearchQueryQuerySortBy
    on QueryBuilder<SearchQuery, SearchQuery, QSortBy> {
  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortBySearchQuery(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortBySearchQueryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortByQueryType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> sortByQueryTypeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension SearchQueryQuerySortThenBy
    on QueryBuilder<SearchQuery, SearchQuery, QSortThenBy> {
  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenBySearchQuery(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenBySearchQueryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenByQueryType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterSortBy> thenByQueryTypeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension SearchQueryQueryWhereDistinct
    on QueryBuilder<SearchQuery, SearchQuery, QDistinct> {
  QueryBuilder<SearchQuery, SearchQuery, QAfterDistinct> distinctBySearchQuery(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchQuery, SearchQuery, QAfterDistinct> distinctByQueryType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }
}

extension SearchQueryQueryProperty1
    on QueryBuilder<SearchQuery, SearchQuery, QProperty> {
  QueryBuilder<SearchQuery, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SearchQuery, String, QAfterProperty> searchQueryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SearchQuery, String, QAfterProperty> queryTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension SearchQueryQueryProperty2<R>
    on QueryBuilder<SearchQuery, R, QAfterProperty> {
  QueryBuilder<SearchQuery, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SearchQuery, (R, String), QAfterProperty> searchQueryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SearchQuery, (R, String), QAfterProperty> queryTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension SearchQueryQueryProperty3<R1, R2>
    on QueryBuilder<SearchQuery, (R1, R2), QAfterProperty> {
  QueryBuilder<SearchQuery, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SearchQuery, (R1, R2, String), QOperations>
      searchQueryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SearchQuery, (R1, R2, String), QOperations> queryTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
