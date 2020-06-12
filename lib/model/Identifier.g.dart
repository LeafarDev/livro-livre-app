// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Identifier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Identifier> _$identifierSerializer = new _$IdentifierSerializer();

class _$IdentifierSerializer implements StructuredSerializer<Identifier> {
  @override
  final Iterable<Type> types = const [Identifier, _$Identifier];
  @override
  final String wireName = 'Identifier';

  @override
  Iterable<Object> serialize(Serializers serializers, Identifier object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.isbn13 != null) {
      result
        ..add('isbn_13')
        ..add(serializers.serialize(object.isbn13,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.openlibrary != null) {
      result
        ..add('openlibrary')
        ..add(serializers.serialize(object.openlibrary,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.isbn10 != null) {
      result
        ..add('isbn_10')
        ..add(serializers.serialize(object.isbn10,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.oclc != null) {
      result
        ..add('oclc')
        ..add(serializers.serialize(object.oclc,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  Identifier deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IdentifierBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isbn_13':
          result.isbn13.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'openlibrary':
          result.openlibrary.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'isbn_10':
          result.isbn10.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'oclc':
          result.oclc.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Identifier extends Identifier {
  @override
  final BuiltList<String> isbn13;
  @override
  final BuiltList<String> openlibrary;
  @override
  final BuiltList<String> isbn10;
  @override
  final BuiltList<String> oclc;

  factory _$Identifier([void Function(IdentifierBuilder) updates]) =>
      (new IdentifierBuilder()..update(updates)).build();

  _$Identifier._({this.isbn13, this.openlibrary, this.isbn10, this.oclc})
      : super._();

  @override
  Identifier rebuild(void Function(IdentifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifierBuilder toBuilder() => new IdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Identifier &&
        isbn13 == other.isbn13 &&
        openlibrary == other.openlibrary &&
        isbn10 == other.isbn10 &&
        oclc == other.oclc;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isbn13.hashCode), openlibrary.hashCode),
            isbn10.hashCode),
        oclc.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Identifier')
          ..add('isbn13', isbn13)
          ..add('openlibrary', openlibrary)
          ..add('isbn10', isbn10)
          ..add('oclc', oclc))
        .toString();
  }
}

class IdentifierBuilder implements Builder<Identifier, IdentifierBuilder> {
  _$Identifier _$v;

  ListBuilder<String> _isbn13;
  ListBuilder<String> get isbn13 =>
      _$this._isbn13 ??= new ListBuilder<String>();
  set isbn13(ListBuilder<String> isbn13) => _$this._isbn13 = isbn13;

  ListBuilder<String> _openlibrary;
  ListBuilder<String> get openlibrary =>
      _$this._openlibrary ??= new ListBuilder<String>();
  set openlibrary(ListBuilder<String> openlibrary) =>
      _$this._openlibrary = openlibrary;

  ListBuilder<String> _isbn10;
  ListBuilder<String> get isbn10 =>
      _$this._isbn10 ??= new ListBuilder<String>();
  set isbn10(ListBuilder<String> isbn10) => _$this._isbn10 = isbn10;

  ListBuilder<String> _oclc;
  ListBuilder<String> get oclc => _$this._oclc ??= new ListBuilder<String>();
  set oclc(ListBuilder<String> oclc) => _$this._oclc = oclc;

  IdentifierBuilder();

  IdentifierBuilder get _$this {
    if (_$v != null) {
      _isbn13 = _$v.isbn13?.toBuilder();
      _openlibrary = _$v.openlibrary?.toBuilder();
      _isbn10 = _$v.isbn10?.toBuilder();
      _oclc = _$v.oclc?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Identifier other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Identifier;
  }

  @override
  void update(void Function(IdentifierBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Identifier build() {
    _$Identifier _$result;
    try {
      _$result = _$v ??
          new _$Identifier._(
              isbn13: _isbn13?.build(),
              openlibrary: _openlibrary?.build(),
              isbn10: _isbn10?.build(),
              oclc: _oclc?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'isbn13';
        _isbn13?.build();
        _$failedField = 'openlibrary';
        _openlibrary?.build();
        _$failedField = 'isbn10';
        _isbn10?.build();
        _$failedField = 'oclc';
        _oclc?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Identifier', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
