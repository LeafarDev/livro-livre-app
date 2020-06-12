import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'Author.g.dart';

abstract class Author implements Built<Author, AuthorBuilder> {
  Author._();

  factory Author([updates(AuthorBuilder b)]) = _$Author;

  @nullable
  @BuiltValueField(wireName: 'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  static Author fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Author author =
        standardSerializers.deserializeWith(Author.serializer, parsed);
    return author;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Author.serializer, this));
  }

  static Serializer<Author> get serializer => _$authorSerializer;
}
