import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'Cover.g.dart';

abstract class Cover implements Built<Cover, CoverBuilder> {
  Cover._();

  factory Cover([updates(CoverBuilder b)]) = _$Cover;

  @nullable
  @BuiltValueField(wireName: 'small')
  String get small;

  @nullable
  @BuiltValueField(wireName: 'large')
  String get large;

  @nullable
  @BuiltValueField(wireName: 'medium')
  String get medium;

  static Cover fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Cover cover = standardSerializers.deserializeWith(Cover.serializer, parsed);
    return cover;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Cover.serializer, this));
  }

  static Serializer<Cover> get serializer => _$coverSerializer;
}
