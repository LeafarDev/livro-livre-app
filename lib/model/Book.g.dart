// GENERATED CODE - DO NOT MODIFY BY HAND

part of book;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Book> _$bookSerializer = new _$BookSerializer();

class _$BookSerializer implements StructuredSerializer<Book> {
  @override
  final Iterable<Type> types = const [Book, _$Book];
  @override
  final String wireName = 'Book';

  @override
  Iterable<Object> serialize(Serializers serializers, Book object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.kind != null) {
      result
        ..add('kind')
        ..add(serializers.serialize(object.kind,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.etag != null) {
      result
        ..add('etag')
        ..add(serializers.serialize(object.etag,
            specifiedType: const FullType(String)));
    }
    if (object.selfLink != null) {
      result
        ..add('selfLink')
        ..add(serializers.serialize(object.selfLink,
            specifiedType: const FullType(String)));
    }
    if (object.volumeInfo != null) {
      result
        ..add('volumeInfo')
        ..add(serializers.serialize(object.volumeInfo,
            specifiedType: const FullType(VolumeInfo)));
    }
    return result;
  }

  @override
  Book deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selfLink':
          result.selfLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volumeInfo':
          result.volumeInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(VolumeInfo)) as VolumeInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$Book extends Book {
  @override
  final String kind;
  @override
  final String id;
  @override
  final String etag;
  @override
  final String selfLink;
  @override
  final VolumeInfo volumeInfo;

  factory _$Book([void Function(BookBuilder) updates]) =>
      (new BookBuilder()..update(updates)).build();

  _$Book._({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo})
      : super._();

  @override
  Book rebuild(void Function(BookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookBuilder toBuilder() => new BookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Book &&
        kind == other.kind &&
        id == other.id &&
        etag == other.etag &&
        selfLink == other.selfLink &&
        volumeInfo == other.volumeInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, kind.hashCode), id.hashCode), etag.hashCode),
            selfLink.hashCode),
        volumeInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Book')
          ..add('kind', kind)
          ..add('id', id)
          ..add('etag', etag)
          ..add('selfLink', selfLink)
          ..add('volumeInfo', volumeInfo))
        .toString();
  }
}

class BookBuilder implements Builder<Book, BookBuilder> {
  _$Book _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _etag;
  String get etag => _$this._etag;
  set etag(String etag) => _$this._etag = etag;

  String _selfLink;
  String get selfLink => _$this._selfLink;
  set selfLink(String selfLink) => _$this._selfLink = selfLink;

  VolumeInfoBuilder _volumeInfo;
  VolumeInfoBuilder get volumeInfo =>
      _$this._volumeInfo ??= new VolumeInfoBuilder();
  set volumeInfo(VolumeInfoBuilder volumeInfo) =>
      _$this._volumeInfo = volumeInfo;

  BookBuilder();

  BookBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _id = _$v.id;
      _etag = _$v.etag;
      _selfLink = _$v.selfLink;
      _volumeInfo = _$v.volumeInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Book other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Book;
  }

  @override
  void update(void Function(BookBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Book build() {
    _$Book _$result;
    try {
      _$result = _$v ??
          new _$Book._(
              kind: kind,
              id: id,
              etag: etag,
              selfLink: selfLink,
              volumeInfo: _volumeInfo?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'volumeInfo';
        _volumeInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Book', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
