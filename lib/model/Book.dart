library book;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

import 'VolumeInfo.dart';

part 'Book.g.dart';

abstract class Book implements Built<Book, BookBuilder> {
  Book._();

  factory Book([updates(BookBuilder b)]) = _$Book;

  @nullable
  @BuiltValueField(wireName: 'kind')
  String get kind;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'etag')
  String get etag;

  @nullable
  @BuiltValueField(wireName: 'selfLink')
  String get selfLink;

  @nullable
  @BuiltValueField(wireName: 'volumeInfo')
  VolumeInfo get volumeInfo;

  static Book fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Book book = standardSerializers.deserializeWith(Book.serializer, parsed);
    return book;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Book.serializer, this));
  }

  static Serializer<Book> get serializer => _$bookSerializer;
}
