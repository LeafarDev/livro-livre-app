library youtube_task_download;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:livro_livre_app/model/serializers.dart';

part 'YoutubeTaskDownload.g.dart';

abstract class YoutubeTaskDownload
    implements Built<YoutubeTaskDownload, YoutubeTaskDownloadBuilder> {
  YoutubeTaskDownload._();

  factory YoutubeTaskDownload([updates(YoutubeTaskDownloadBuilder b)]) =
      _$YoutubeTaskDownload;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'progresso')
  int get progresso;

  @BuiltValueField(wireName: 'ultimaAtualizacao')
  DateTime get ultimaAtualizacao;

  static YoutubeTaskDownload fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    YoutubeTaskDownload youtubeTaskDownload = standardSerializers
        .deserializeWith(YoutubeTaskDownload.serializer, parsed);
    return youtubeTaskDownload;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        YoutubeTaskDownload.serializer, this));
  }

  static Serializer<YoutubeTaskDownload> get serializer =>
      _$youtubeTaskDownloadSerializer;
}
