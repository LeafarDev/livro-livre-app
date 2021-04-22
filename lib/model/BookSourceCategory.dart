library categoria_livro;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'BookSourceCategory.g.dart';

abstract class BookSourceCategory
    implements Built<BookSourceCategory, BookSourceCategoryBuilder> {
  BookSourceCategory._();

  factory BookSourceCategory([updates(BookSourceCategoryBuilder b)]) =
      _$BookSourceCategory;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'link')
  String get link;

  static BookSourceCategory fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    BookSourceCategory bookSourceCategory = standardSerializers
        .deserializeWith(BookSourceCategory.serializer, parsed);
    return bookSourceCategory;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        BookSourceCategory.serializer, this));
  }

  static Serializer<BookSourceCategory> get serializer =>
      _$bookSourceCategorySerializer;
}
