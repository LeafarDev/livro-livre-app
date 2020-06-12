// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Classifications.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Classifications> _$classificationsSerializer =
    new _$ClassificationsSerializer();

class _$ClassificationsSerializer
    implements StructuredSerializer<Classifications> {
  @override
  final Iterable<Type> types = const [Classifications, _$Classifications];
  @override
  final String wireName = 'Classifications';

  @override
  Iterable<Object> serialize(Serializers serializers, Classifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.lcClassifications != null) {
      result
        ..add('lc_classifications')
        ..add(serializers.serialize(object.lcClassifications,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  Classifications deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lc_classifications':
          result.lcClassifications.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Classifications extends Classifications {
  @override
  final BuiltList<String> lcClassifications;

  factory _$Classifications([void Function(ClassificationsBuilder) updates]) =>
      (new ClassificationsBuilder()..update(updates)).build();

  _$Classifications._({this.lcClassifications}) : super._();

  @override
  Classifications rebuild(void Function(ClassificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassificationsBuilder toBuilder() =>
      new ClassificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Classifications &&
        lcClassifications == other.lcClassifications;
  }

  @override
  int get hashCode {
    return $jf($jc(0, lcClassifications.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Classifications')
          ..add('lcClassifications', lcClassifications))
        .toString();
  }
}

class ClassificationsBuilder
    implements Builder<Classifications, ClassificationsBuilder> {
  _$Classifications _$v;

  ListBuilder<String> _lcClassifications;
  ListBuilder<String> get lcClassifications =>
      _$this._lcClassifications ??= new ListBuilder<String>();
  set lcClassifications(ListBuilder<String> lcClassifications) =>
      _$this._lcClassifications = lcClassifications;

  ClassificationsBuilder();

  ClassificationsBuilder get _$this {
    if (_$v != null) {
      _lcClassifications = _$v.lcClassifications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Classifications other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Classifications;
  }

  @override
  void update(void Function(ClassificationsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Classifications build() {
    _$Classifications _$result;
    try {
      _$result = _$v ??
          new _$Classifications._(
              lcClassifications: _lcClassifications?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lcClassifications';
        _lcClassifications?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Classifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
