import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'PublishPlace.g.dart';

abstract class PublishPlace
    implements Built<PublishPlace, PublishPlaceBuilder> {
  PublishPlace._();

  factory PublishPlace([updates(PublishPlaceBuilder b)]) = _$PublishPlace;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  static PublishPlace fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    PublishPlace publishPlace =
        standardSerializers.deserializeWith(PublishPlace.serializer, parsed);
    return publishPlace;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(PublishPlace.serializer, this));
  }

  static Serializer<PublishPlace> get serializer => _$publishPlaceSerializer;
}
