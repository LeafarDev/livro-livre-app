// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_links;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageLinks> _$imageLinksSerializer = new _$ImageLinksSerializer();

class _$ImageLinksSerializer implements StructuredSerializer<ImageLinks> {
  @override
  final Iterable<Type> types = const [ImageLinks, _$ImageLinks];
  @override
  final String wireName = 'ImageLinks';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageLinks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.smallThumbnail != null) {
      result
        ..add('smallThumbnail')
        ..add(serializers.serialize(object.smallThumbnail,
            specifiedType: const FullType(String)));
    }
    if (object.thumbnail != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(object.thumbnail,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ImageLinks deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageLinksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'smallThumbnail':
          result.smallThumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageLinks extends ImageLinks {
  @override
  final String smallThumbnail;
  @override
  final String thumbnail;

  factory _$ImageLinks([void Function(ImageLinksBuilder) updates]) =>
      (new ImageLinksBuilder()..update(updates)).build();

  _$ImageLinks._({this.smallThumbnail, this.thumbnail}) : super._();

  @override
  ImageLinks rebuild(void Function(ImageLinksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageLinksBuilder toBuilder() => new ImageLinksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageLinks &&
        smallThumbnail == other.smallThumbnail &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, smallThumbnail.hashCode), thumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageLinks')
          ..add('smallThumbnail', smallThumbnail)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class ImageLinksBuilder implements Builder<ImageLinks, ImageLinksBuilder> {
  _$ImageLinks _$v;

  String _smallThumbnail;
  String get smallThumbnail => _$this._smallThumbnail;
  set smallThumbnail(String smallThumbnail) =>
      _$this._smallThumbnail = smallThumbnail;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  ImageLinksBuilder();

  ImageLinksBuilder get _$this {
    if (_$v != null) {
      _smallThumbnail = _$v.smallThumbnail;
      _thumbnail = _$v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageLinks other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageLinks;
  }

  @override
  void update(void Function(ImageLinksBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageLinks build() {
    final _$result = _$v ??
        new _$ImageLinks._(
            smallThumbnail: smallThumbnail, thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
