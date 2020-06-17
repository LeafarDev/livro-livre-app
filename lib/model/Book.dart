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
  @BuiltValueField(wireName: 'pdfLink')
  String get pdfLink;

  @nullable
  @BuiltValueField(wireName: 'extracted_title')
  String get extractedTitle;

  @nullable
  @BuiltValueField(wireName: 'extracted_author')
  String get extractedAuthor;

  @nullable
  @BuiltValueField(wireName: 'pdf_path')
  String get pdfPath;

  @nullable
  @BuiltValueField(wireName: 'audio_path')
  String get audio_path;

  @nullable
  @BuiltValueField(wireName: 'current_position_audio')
  String get currentPositionAudio;

  @nullable
  @BuiltValueField(wireName: 'ytCode')
  String get ytCode;

  @nullable
  @BuiltValueField(wireName: 'current_page')
  int get currentPage;

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

  String shortExtractedTitle({textSize = 20}) {
    if (extractedTitle != null && extractedTitle.length > textSize) {
      return "${extractedTitle.substring(0, textSize)}...";
    }
    return extractedTitle;
  }

  String shortExtractedAuthor({textSize = 20}) {
    if (extractedAuthor != null && extractedAuthor.length > textSize) {
      return "${extractedAuthor.substring(0, textSize)}...";
    }
    return extractedAuthor;
  }

  Map<String, dynamic> toSqlFormat() {
    Map<String, dynamic> row = {
      "id": id,
      "data": toJson(),
      "pdf_link": pdfLink
    };
    return row;
  }

  static Serializer<Book> get serializer => _$bookSerializer;
}
