import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'Classifications.g.dart';

abstract class Classifications
    implements Built<Classifications, ClassificationsBuilder> {
  Classifications._();

  factory Classifications([updates(ClassificationsBuilder b)]) =
      _$Classifications;

  @nullable
  @BuiltValueField(wireName: 'lc_classifications')
  BuiltList<String> get lcClassifications;

  static Classifications fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Classifications classifications =
        standardSerializers.deserializeWith(Classifications.serializer, parsed);
    return classifications;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(Classifications.serializer, this));
  }

  static Serializer<Classifications> get serializer =>
      _$classificationsSerializer;
}
