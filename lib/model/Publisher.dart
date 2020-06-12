import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'Publisher.g.dart';

abstract class Publisher implements Built<Publisher, PublisherBuilder> {
  Publisher._();

  factory Publisher([updates(PublisherBuilder b)]) = _$Publisher;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  static Publisher fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Publisher publisher =
        standardSerializers.deserializeWith(Publisher.serializer, parsed);
    return publisher;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Publisher.serializer, this));
  }

  static Serializer<Publisher> get serializer => _$publisherSerializer;
}
