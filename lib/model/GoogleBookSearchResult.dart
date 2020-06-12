library google_book_search_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

import 'Book.dart';

part 'GoogleBookSearchResult.g.dart';

abstract class GoogleBookSearchResult
    implements Built<GoogleBookSearchResult, GoogleBookSearchResultBuilder> {
  GoogleBookSearchResult._();

  factory GoogleBookSearchResult([updates(GoogleBookSearchResultBuilder b)]) =
      _$GoogleBookSearchResult;

  @nullable
  @BuiltValueField(wireName: 'kind')
  String get kind;

  @nullable
  @BuiltValueField(wireName: 'totalItems')
  int get totalItems;

  @nullable
  @BuiltValueField(wireName: 'items')
  BuiltList<Book> get items;

  static GoogleBookSearchResult fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    GoogleBookSearchResult googleBookSearchResult = standardSerializers
        .deserializeWith(GoogleBookSearchResult.serializer, parsed);
    return googleBookSearchResult;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        GoogleBookSearchResult.serializer, this));
  }

  static Serializer<GoogleBookSearchResult> get serializer =>
      _$googleBookSearchResultSerializer;
}
