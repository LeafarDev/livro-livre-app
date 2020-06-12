import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'Identifier.g.dart';

abstract class Identifier implements Built<Identifier, IdentifierBuilder> {
  Identifier._();

  factory Identifier([updates(IdentifierBuilder b)]) = _$Identifier;

  @nullable
  @BuiltValueField(wireName: 'isbn_13')
  BuiltList<String> get isbn13;

  @nullable
  @BuiltValueField(wireName: 'openlibrary')
  BuiltList<String> get openlibrary;

  @nullable
  @BuiltValueField(wireName: 'isbn_10')
  BuiltList<String> get isbn10;

  @nullable
  @BuiltValueField(wireName: 'oclc')
  BuiltList<String> get oclc;

  static Identifier fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Identifier identifier =
        standardSerializers.deserializeWith(Identifier.serializer, parsed);
    return identifier;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Identifier.serializer, this));
  }

  static Serializer<Identifier> get serializer => _$identifierSerializer;
}
