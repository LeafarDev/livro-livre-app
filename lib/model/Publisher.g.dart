// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Publisher.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Publisher> _$publisherSerializer = new _$PublisherSerializer();

class _$PublisherSerializer implements StructuredSerializer<Publisher> {
  @override
  final Iterable<Type> types = const [Publisher, _$Publisher];
  @override
  final String wireName = 'Publisher';

  @override
  Iterable<Object> serialize(Serializers serializers, Publisher object,
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
  Publisher deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublisherBuilder();

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

class _$Publisher extends Publisher {
  @override
  final String name;

  factory _$Publisher([void Function(PublisherBuilder) updates]) =>
      (new PublisherBuilder()..update(updates)).build();

  _$Publisher._({this.name}) : super._();

  @override
  Publisher rebuild(void Function(PublisherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublisherBuilder toBuilder() => new PublisherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Publisher && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Publisher')..add('name', name))
        .toString();
  }
}

class PublisherBuilder implements Builder<Publisher, PublisherBuilder> {
  _$Publisher _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PublisherBuilder();

  PublisherBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Publisher other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Publisher;
  }

  @override
  void update(void Function(PublisherBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Publisher build() {
    final _$result = _$v ?? new _$Publisher._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
