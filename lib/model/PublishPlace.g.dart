// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublishPlace.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PublishPlace> _$publishPlaceSerializer =
    new _$PublishPlaceSerializer();

class _$PublishPlaceSerializer implements StructuredSerializer<PublishPlace> {
  @override
  final Iterable<Type> types = const [PublishPlace, _$PublishPlace];
  @override
  final String wireName = 'PublishPlace';

  @override
  Iterable<Object> serialize(Serializers serializers, PublishPlace object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PublishPlace deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublishPlaceBuilder();

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
      }
    }

    return result.build();
  }
}

class _$PublishPlace extends PublishPlace {
  @override
  final String name;

  factory _$PublishPlace([void Function(PublishPlaceBuilder) updates]) =>
      (new PublishPlaceBuilder()..update(updates)).build();

  _$PublishPlace._({this.name}) : super._();

  @override
  PublishPlace rebuild(void Function(PublishPlaceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublishPlaceBuilder toBuilder() => new PublishPlaceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublishPlace && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PublishPlace')..add('name', name))
        .toString();
  }
}

class PublishPlaceBuilder
    implements Builder<PublishPlace, PublishPlaceBuilder> {
  _$PublishPlace _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PublishPlaceBuilder();

  PublishPlaceBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublishPlace other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PublishPlace;
  }

  @override
  void update(void Function(PublishPlaceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PublishPlace build() {
    final _$result = _$v ?? new _$PublishPlace._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
