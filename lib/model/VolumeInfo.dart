library volume_info;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

import 'ImageLinks.dart';

part 'VolumeInfo.g.dart';

abstract class VolumeInfo implements Built<VolumeInfo, VolumeInfoBuilder> {
  VolumeInfo._();

  factory VolumeInfo([updates(VolumeInfoBuilder b)]) = _$VolumeInfo;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'subtitle')
  String get subtitle;

  @nullable
  @BuiltValueField(wireName: 'authors')
  BuiltList<String> get authors;

  @nullable
  @BuiltValueField(wireName: 'publisher')
  String get publisher;

  @nullable
  @BuiltValueField(wireName: 'publishedDate')
  String get publishedDate;

  @nullable
  @BuiltValueField(wireName: 'description')
  String get description;

  @nullable
  @BuiltValueField(wireName: 'pageCount')
  int get pageCount;

  @nullable
  @BuiltValueField(wireName: 'printType')
  String get printType;

  @nullable
  @BuiltValueField(wireName: 'categories')
  BuiltList<String> get categories;

  @nullable
  @BuiltValueField(wireName: 'maturityRating')
  String get maturityRating;

  @nullable
  @BuiltValueField(wireName: 'allowAnonLogging')
  bool get allowAnonLogging;

  @nullable
  @BuiltValueField(wireName: 'contentVersion')
  String get contentVersion;

  @nullable
  @BuiltValueField(wireName: 'imageLinks')
  ImageLinks get imageLinks;

  @nullable
  @BuiltValueField(wireName: 'language')
  String get language;

  @nullable
  @BuiltValueField(wireName: 'previewLink')
  String get previewLink;

  @nullable
  @BuiltValueField(wireName: 'infoLink')
  String get infoLink;

  @nullable
  @BuiltValueField(wireName: 'canonicalVolumeLink')
  String get canonicalVolumeLink;

  static VolumeInfo fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    VolumeInfo volumeInfo =
        standardSerializers.deserializeWith(VolumeInfo.serializer, parsed);
    return volumeInfo;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(VolumeInfo.serializer, this));
  }

  static Serializer<VolumeInfo> get serializer => _$volumeInfoSerializer;
}
