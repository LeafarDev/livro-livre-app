// GENERATED CODE - DO NOT MODIFY BY HAND

part of youtube_task_download;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<YoutubeTaskDownload> _$youtubeTaskDownloadSerializer =
    new _$YoutubeTaskDownloadSerializer();

class _$YoutubeTaskDownloadSerializer
    implements StructuredSerializer<YoutubeTaskDownload> {
  @override
  final Iterable<Type> types = const [
    YoutubeTaskDownload,
    _$YoutubeTaskDownload
  ];
  @override
  final String wireName = 'YoutubeTaskDownload';

  @override
  Iterable<Object> serialize(
      Serializers serializers, YoutubeTaskDownload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'progress',
      serializers.serialize(object.progress,
          specifiedType: const FullType(int)),
      'lastUpdate',
      serializers.serialize(object.lastUpdate,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  YoutubeTaskDownload deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeTaskDownloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'progress':
          result.progress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lastUpdate':
          result.lastUpdate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeTaskDownload extends YoutubeTaskDownload {
  @override
  final String id;
  @override
  final int progress;
  @override
  final DateTime lastUpdate;

  factory _$YoutubeTaskDownload(
          [void Function(YoutubeTaskDownloadBuilder) updates]) =>
      (new YoutubeTaskDownloadBuilder()..update(updates)).build();

  _$YoutubeTaskDownload._({this.id, this.progress, this.lastUpdate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('YoutubeTaskDownload', 'id');
    }
    if (progress == null) {
      throw new BuiltValueNullFieldError('YoutubeTaskDownload', 'progress');
    }
    if (lastUpdate == null) {
      throw new BuiltValueNullFieldError('YoutubeTaskDownload', 'lastUpdate');
    }
  }

  @override
  YoutubeTaskDownload rebuild(
          void Function(YoutubeTaskDownloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeTaskDownloadBuilder toBuilder() =>
      new YoutubeTaskDownloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeTaskDownload &&
        id == other.id &&
        progress == other.progress &&
        lastUpdate == other.lastUpdate;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), progress.hashCode), lastUpdate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeTaskDownload')
          ..add('id', id)
          ..add('progress', progress)
          ..add('lastUpdate', lastUpdate))
        .toString();
  }
}

class YoutubeTaskDownloadBuilder
    implements Builder<YoutubeTaskDownload, YoutubeTaskDownloadBuilder> {
  _$YoutubeTaskDownload _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _progress;
  int get progress => _$this._progress;
  set progress(int progress) => _$this._progress = progress;

  DateTime _lastUpdate;
  DateTime get lastUpdate => _$this._lastUpdate;
  set lastUpdate(DateTime lastUpdate) => _$this._lastUpdate = lastUpdate;

  YoutubeTaskDownloadBuilder();

  YoutubeTaskDownloadBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _progress = _$v.progress;
      _lastUpdate = _$v.lastUpdate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeTaskDownload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeTaskDownload;
  }

  @override
  void update(void Function(YoutubeTaskDownloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeTaskDownload build() {
    final _$result = _$v ??
        new _$YoutubeTaskDownload._(
            id: id, progress: progress, lastUpdate: lastUpdate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
