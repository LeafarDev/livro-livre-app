// GENERATED CODE - DO NOT MODIFY BY HAND

part of categoria_livro;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookSourceCategory> _$bookSourceCategorySerializer =
    new _$BookSourceCategorySerializer();

class _$BookSourceCategorySerializer
    implements StructuredSerializer<BookSourceCategory> {
  @override
  final Iterable<Type> types = const [BookSourceCategory, _$BookSourceCategory];
  @override
  final String wireName = 'BookSourceCategory';

  @override
  Iterable<Object> serialize(Serializers serializers, BookSourceCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BookSourceCategory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookSourceCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BookSourceCategory extends BookSourceCategory {
  @override
  final String name;
  @override
  final String link;

  factory _$BookSourceCategory(
          [void Function(BookSourceCategoryBuilder) updates]) =>
      (new BookSourceCategoryBuilder()..update(updates)).build();

  _$BookSourceCategory._({this.name, this.link}) : super._();

  @override
  BookSourceCategory rebuild(
          void Function(BookSourceCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookSourceCategoryBuilder toBuilder() =>
      new BookSourceCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookSourceCategory &&
        name == other.name &&
        link == other.link;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BookSourceCategory')
          ..add('name', name)
          ..add('link', link))
        .toString();
  }
}

class BookSourceCategoryBuilder
    implements Builder<BookSourceCategory, BookSourceCategoryBuilder> {
  _$BookSourceCategory _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  BookSourceCategoryBuilder();

  BookSourceCategoryBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _link = _$v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookSourceCategory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BookSourceCategory;
  }

  @override
  void update(void Function(BookSourceCategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BookSourceCategory build() {
    final _$result = _$v ?? new _$BookSourceCategory._(name: name, link: link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
