library image_links;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'ImageLinks.g.dart';

abstract class ImageLinks implements Built<ImageLinks, ImageLinksBuilder> {
  ImageLinks._();

  factory ImageLinks([updates(ImageLinksBuilder b)]) = _$ImageLinks;

  @nullable
  @BuiltValueField(wireName: 'smallThumbnail')
  String get smallThumbnail;

  @nullable
  @BuiltValueField(wireName: 'thumbnail')
  String get thumbnail;

  static ImageLinks fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    ImageLinks imageLinks =
        standardSerializers.deserializeWith(ImageLinks.serializer, parsed);
    return imageLinks;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(ImageLinks.serializer, this));
  }

  static Serializer<ImageLinks> get serializer => _$imageLinksSerializer;
}
