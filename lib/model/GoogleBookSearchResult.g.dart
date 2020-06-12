// GENERATED CODE - DO NOT MODIFY BY HAND

part of google_book_search_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GoogleBookSearchResult> _$googleBookSearchResultSerializer =
    new _$GoogleBookSearchResultSerializer();

class _$GoogleBookSearchResultSerializer
    implements StructuredSerializer<GoogleBookSearchResult> {
  @override
  final Iterable<Type> types = const [
    GoogleBookSearchResult,
    _$GoogleBookSearchResult
  ];
  @override
  final String wireName = 'GoogleBookSearchResult';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GoogleBookSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.kind != null) {
      result
        ..add('kind')
        ..add(serializers.serialize(object.kind,
            specifiedType: const FullType(String)));
    }
    if (object.totalItems != null) {
      result
        ..add('totalItems')
        ..add(serializers.serialize(object.totalItems,
            specifiedType: const FullType(int)));
    }
    if (object.items != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.items,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Book)])));
    }
    return result;
  }

  @override
  GoogleBookSearchResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoogleBookSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalItems':
          result.totalItems = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Book)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$GoogleBookSearchResult extends GoogleBookSearchResult {
  @override
  final String kind;
  @override
  final int totalItems;
  @override
  final BuiltList<Book> items;

  factory _$GoogleBookSearchResult(
          [void Function(GoogleBookSearchResultBuilder) updates]) =>
      (new GoogleBookSearchResultBuilder()..update(updates)).build();

  _$GoogleBookSearchResult._({this.kind, this.totalItems, this.items})
      : super._();

  @override
  GoogleBookSearchResult rebuild(
          void Function(GoogleBookSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoogleBookSearchResultBuilder toBuilder() =>
      new GoogleBookSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoogleBookSearchResult &&
        kind == other.kind &&
        totalItems == other.totalItems &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, kind.hashCode), totalItems.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GoogleBookSearchResult')
          ..add('kind', kind)
          ..add('totalItems', totalItems)
          ..add('items', items))
        .toString();
  }
}

class GoogleBookSearchResultBuilder
    implements Builder<GoogleBookSearchResult, GoogleBookSearchResultBuilder> {
  _$GoogleBookSearchResult _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  int _totalItems;
  int get totalItems => _$this._totalItems;
  set totalItems(int totalItems) => _$this._totalItems = totalItems;

  ListBuilder<Book> _items;
  ListBuilder<Book> get items => _$this._items ??= new ListBuilder<Book>();
  set items(ListBuilder<Book> items) => _$this._items = items;

  GoogleBookSearchResultBuilder();

  GoogleBookSearchResultBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _totalItems = _$v.totalItems;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoogleBookSearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GoogleBookSearchResult;
  }

  @override
  void update(void Function(GoogleBookSearchResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GoogleBookSearchResult build() {
    _$GoogleBookSearchResult _$result;
    try {
      _$result = _$v ??
          new _$GoogleBookSearchResult._(
              kind: kind, totalItems: totalItems, items: _items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GoogleBookSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
