// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cover.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cover> _$coverSerializer = new _$CoverSerializer();

class _$CoverSerializer implements StructuredSerializer<Cover> {
  @override
  final Iterable<Type> types = const [Cover, _$Cover];
  @override
  final String wireName = 'Cover';

  @override
  Iterable<Object> serialize(Serializers serializers, Cover object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.small != null) {
      result
        ..add('small')
        ..add(serializers.serialize(object.small,
            specifiedType: const FullType(String)));
    }
    if (object.large != null) {
      result
        ..add('large')
        ..add(serializers.serialize(object.large,
            specifiedType: const FullType(String)));
    }
    if (object.medium != null) {
      result
        ..add('medium')
        ..add(serializers.serialize(object.medium,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Cover deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoverBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'small':
          result.small = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'large':
          result.large = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'medium':
          result.medium = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Cover extends Cover {
  @override
  final String small;
  @override
  final String large;
  @override
  final String medium;

  factory _$Cover([void Function(CoverBuilder) updates]) =>
      (new CoverBuilder()..update(updates)).build();

  _$Cover._({this.small, this.large, this.medium}) : super._();

  @override
  Cover rebuild(void Function(CoverBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoverBuilder toBuilder() => new CoverBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cover &&
        small == other.small &&
        large == other.large &&
        medium == other.medium;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, small.hashCode), large.hashCode), medium.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cover')
          ..add('small', small)
          ..add('large', large)
          ..add('medium', medium))
        .toString();
  }
}

class CoverBuilder implements Builder<Cover, CoverBuilder> {
  _$Cover _$v;

  String _small;
  String get small => _$this._small;
  set small(String small) => _$this._small = small;

  String _large;
  String get large => _$this._large;
  set large(String large) => _$this._large = large;

  String _medium;
  String get medium => _$this._medium;
  set medium(String medium) => _$this._medium = medium;

  CoverBuilder();

  CoverBuilder get _$this {
    if (_$v != null) {
      _small = _$v.small;
      _large = _$v.large;
      _medium = _$v.medium;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cover other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Cover;
  }

  @override
  void update(void Function(CoverBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Cover build() {
    final _$result =
        _$v ?? new _$Cover._(small: small, large: large, medium: medium);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
