library categoria_livro;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'LivroLivreCategoriaBook.g.dart';

abstract class LivroLivreCategoriaBook
    implements Built<LivroLivreCategoriaBook, LivroLivreCategoriaBookBuilder> {
  LivroLivreCategoriaBook._();

  factory LivroLivreCategoriaBook([updates(LivroLivreCategoriaBookBuilder b)]) =
      _$LivroLivreCategoriaBook;

  @nullable
  @BuiltValueField(wireName: 'nome')
  String get nome;

  @nullable
  @BuiltValueField(wireName: 'link')
  String get link;

  static LivroLivreCategoriaBook fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    LivroLivreCategoriaBook livroLivreCategoriaBook = standardSerializers
        .deserializeWith(LivroLivreCategoriaBook.serializer, parsed);
    return livroLivreCategoriaBook;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        LivroLivreCategoriaBook.serializer, this));
  }

  static Serializer<LivroLivreCategoriaBook> get serializer =>
      _$livroLivreCategoriaBookSerializer;
}
