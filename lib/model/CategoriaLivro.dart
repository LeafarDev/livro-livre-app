library categoria_livro;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'CategoriaLivro.g.dart';

abstract class CategoriaLivro
    implements Built<CategoriaLivro, CategoriaLivroBuilder> {
  CategoriaLivro._();

  factory CategoriaLivro([updates(CategoriaLivroBuilder b)]) = _$CategoriaLivro;

  @BuiltValueField(wireName: 'nome')
  String get nome;
  @BuiltValueField(wireName: 'link')
  String get link;

  static CategoriaLivro fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    CategoriaLivro categoriaLivro = standardSerializers.deserializeWith(CategoriaLivro.serializer, parsed);
    return categoriaLivro;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(CategoriaLivro.serializer, this));
  }
  static Serializer<CategoriaLivro> get serializer => _$categoriaLivroSerializer;
}
