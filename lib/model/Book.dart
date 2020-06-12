import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

import 'Author.dart';
import 'Classifications.dart';
import 'Cover.dart';
import 'Identifier.dart';
import 'PublishPlace.dart';
import 'Publisher.dart';

part 'Book.g.dart';

abstract class Book implements Built<Book, BookBuilder> {
  Book._();

  factory Book([updates(BookBuilder b)]) = _$Book;

  @nullable
  @BuiltValueField(wireName: 'Publisher')
  BuiltList<Publisher> get publisher;

  @nullable
  @BuiltValueField(wireName: 'pagination')
  String get pagination;

  @nullable
  @BuiltValueField(wireName: 'Identifier')
  Identifier get identifier;

  @nullable
  @BuiltValueField(wireName: 'classifications')
  Classifications get classifications;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: 'pdf_url')
  String get pdf_url;

  @nullable
  @BuiltValueField(wireName: 'audio_url')
  String get audio_url;

  @nullable
  @BuiltValueField(wireName: 'notes')
  String get notes;

  @nullable
  @BuiltValueField(wireName: 'number_of_pages')
  int get numberOfPages;

  @nullable
  @BuiltValueField(wireName: 'cover')
  Cover get cover;

  @nullable
  @BuiltValueField(wireName: 'publish_date')
  String get publishDate;

  @nullable
  @BuiltValueField(wireName: 'key')
  String get key;

  @nullable
  @BuiltValueField(wireName: 'Author')
  BuiltList<Author> get author;

  @nullable
  @BuiltValueField(wireName: 'by_statement')
  String get byStatement;

  @nullable
  @BuiltValueField(wireName: 'publish_places')
  BuiltList<PublishPlace> get publishPlace;

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
