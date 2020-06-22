// GENERATED CODE - DO NOT MODIFY BY HAND

part of book;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Book> _$bookSerializer = new _$BookSerializer();

class _$BookSerializer implements StructuredSerializer<Book> {
  @override
  final Iterable<Type> types = const [Book, _$Book];
  @override
  final String wireName = 'Book';

  @override
  Iterable<Object> serialize(Serializers serializers, Book object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.kind != null) {
      result
        ..add('kind')
        ..add(serializers.serialize(object.kind,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.etag != null) {
      result
        ..add('etag')
        ..add(serializers.serialize(object.etag,
            specifiedType: const FullType(String)));
    }
    if (object.selfLink != null) {
      result
        ..add('selfLink')
        ..add(serializers.serialize(object.selfLink,
            specifiedType: const FullType(String)));
    }
    if (object.pdfLink != null) {
      result
        ..add('pdfLink')
        ..add(serializers.serialize(object.pdfLink,
            specifiedType: const FullType(String)));
    }
    if (object.extractedTitle != null) {
      result
        ..add('extracted_title')
        ..add(serializers.serialize(object.extractedTitle,
            specifiedType: const FullType(String)));
    }
    if (object.extractedAuthor != null) {
      result
        ..add('extracted_author')
        ..add(serializers.serialize(object.extractedAuthor,
            specifiedType: const FullType(String)));
    }
    if (object.pdfPath != null) {
      result
        ..add('pdf_path')
        ..add(serializers.serialize(object.pdfPath,
            specifiedType: const FullType(String)));
    }
    if (object.audio_path != null) {
      result
        ..add('audio_path')
        ..add(serializers.serialize(object.audio_path,
            specifiedType: const FullType(String)));
    }
    if (object.favorite != null) {
      result
        ..add('favorite')
        ..add(serializers.serialize(object.favorite,
            specifiedType: const FullType(bool)));
    }
    if (object.currentPositionAudio != null) {
      result
        ..add('current_position_audio')
        ..add(serializers.serialize(object.currentPositionAudio,
            specifiedType: const FullType(String)));
    }
    if (object.ytCode != null) {
      result
        ..add('ytCode')
        ..add(serializers.serialize(object.ytCode,
            specifiedType: const FullType(String)));
    }
    if (object.currentPage != null) {
      result
        ..add('current_page')
        ..add(serializers.serialize(object.currentPage,
            specifiedType: const FullType(int)));
    }
    if (object.volumeInfo != null) {
      result
        ..add('volumeInfo')
        ..add(serializers.serialize(object.volumeInfo,
            specifiedType: const FullType(VolumeInfo)));
    }
    return result;
  }

  @override
  Book deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selfLink':
          result.selfLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pdfLink':
          result.pdfLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'extracted_title':
          result.extractedTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'extracted_author':
          result.extractedAuthor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pdf_path':
          result.pdfPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audio_path':
          result.audio_path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'current_position_audio':
          result.currentPositionAudio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ytCode':
          result.ytCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_page':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'volumeInfo':
          result.volumeInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(VolumeInfo)) as VolumeInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$Book extends Book {
  @override
  final String kind;
  @override
  final String id;
  @override
  final String etag;
  @override
  final String selfLink;
  @override
  final String pdfLink;
  @override
  final String extractedTitle;
  @override
  final String extractedAuthor;
  @override
  final String pdfPath;
  @override
  final String audio_path;
  @override
  final bool favorite;
  @override
  final String currentPositionAudio;
  @override
  final String ytCode;
  @override
  final int currentPage;
  @override
  final VolumeInfo volumeInfo;

  factory _$Book([void Function(BookBuilder) updates]) =>
      (new BookBuilder()..update(updates)).build();

  _$Book._(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.pdfLink,
      this.extractedTitle,
      this.extractedAuthor,
      this.pdfPath,
      this.audio_path,
      this.favorite,
      this.currentPositionAudio,
      this.ytCode,
      this.currentPage,
      this.volumeInfo})
      : super._();

  @override
  Book rebuild(void Function(BookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookBuilder toBuilder() => new BookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Book &&
        kind == other.kind &&
        id == other.id &&
        etag == other.etag &&
        selfLink == other.selfLink &&
        pdfLink == other.pdfLink &&
        extractedTitle == other.extractedTitle &&
        extractedAuthor == other.extractedAuthor &&
        pdfPath == other.pdfPath &&
        audio_path == other.audio_path &&
        favorite == other.favorite &&
        currentPositionAudio == other.currentPositionAudio &&
        ytCode == other.ytCode &&
        currentPage == other.currentPage &&
        volumeInfo == other.volumeInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, kind.hashCode),
                                                        id.hashCode),
                                                    etag.hashCode),
                                                selfLink.hashCode),
                                            pdfLink.hashCode),
                                        extractedTitle.hashCode),
                                    extractedAuthor.hashCode),
                                pdfPath.hashCode),
                            audio_path.hashCode),
                        favorite.hashCode),
                    currentPositionAudio.hashCode),
                ytCode.hashCode),
            currentPage.hashCode),
        volumeInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Book')
          ..add('kind', kind)
          ..add('id', id)
          ..add('etag', etag)
          ..add('selfLink', selfLink)
          ..add('pdfLink', pdfLink)
          ..add('extractedTitle', extractedTitle)
          ..add('extractedAuthor', extractedAuthor)
          ..add('pdfPath', pdfPath)
          ..add('audio_path', audio_path)
          ..add('favorite', favorite)
          ..add('currentPositionAudio', currentPositionAudio)
          ..add('ytCode', ytCode)
          ..add('currentPage', currentPage)
          ..add('volumeInfo', volumeInfo))
        .toString();
  }
}

class BookBuilder implements Builder<Book, BookBuilder> {
  _$Book _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _etag;
  String get etag => _$this._etag;
  set etag(String etag) => _$this._etag = etag;

  String _selfLink;
  String get selfLink => _$this._selfLink;
  set selfLink(String selfLink) => _$this._selfLink = selfLink;

  String _pdfLink;
  String get pdfLink => _$this._pdfLink;
  set pdfLink(String pdfLink) => _$this._pdfLink = pdfLink;

  String _extractedTitle;
  String get extractedTitle => _$this._extractedTitle;
  set extractedTitle(String extractedTitle) =>
      _$this._extractedTitle = extractedTitle;

  String _extractedAuthor;
  String get extractedAuthor => _$this._extractedAuthor;
  set extractedAuthor(String extractedAuthor) =>
      _$this._extractedAuthor = extractedAuthor;

  String _pdfPath;
  String get pdfPath => _$this._pdfPath;
  set pdfPath(String pdfPath) => _$this._pdfPath = pdfPath;

  String _audio_path;
  String get audio_path => _$this._audio_path;
  set audio_path(String audio_path) => _$this._audio_path = audio_path;

  bool _favorite;
  bool get favorite => _$this._favorite;
  set favorite(bool favorite) => _$this._favorite = favorite;

  String _currentPositionAudio;
  String get currentPositionAudio => _$this._currentPositionAudio;
  set currentPositionAudio(String currentPositionAudio) =>
      _$this._currentPositionAudio = currentPositionAudio;

  String _ytCode;
  String get ytCode => _$this._ytCode;
  set ytCode(String ytCode) => _$this._ytCode = ytCode;

  int _currentPage;
  int get currentPage => _$this._currentPage;
  set currentPage(int currentPage) => _$this._currentPage = currentPage;

  VolumeInfoBuilder _volumeInfo;
  VolumeInfoBuilder get volumeInfo =>
      _$this._volumeInfo ??= new VolumeInfoBuilder();
  set volumeInfo(VolumeInfoBuilder volumeInfo) =>
      _$this._volumeInfo = volumeInfo;

  BookBuilder();

  BookBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _id = _$v.id;
      _etag = _$v.etag;
      _selfLink = _$v.selfLink;
      _pdfLink = _$v.pdfLink;
      _extractedTitle = _$v.extractedTitle;
      _extractedAuthor = _$v.extractedAuthor;
      _pdfPath = _$v.pdfPath;
      _audio_path = _$v.audio_path;
      _favorite = _$v.favorite;
      _currentPositionAudio = _$v.currentPositionAudio;
      _ytCode = _$v.ytCode;
      _currentPage = _$v.currentPage;
      _volumeInfo = _$v.volumeInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Book other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Book;
  }

  @override
  void update(void Function(BookBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Book build() {
    _$Book _$result;
    try {
      _$result = _$v ??
          new _$Book._(
              kind: kind,
              id: id,
              etag: etag,
              selfLink: selfLink,
              pdfLink: pdfLink,
              extractedTitle: extractedTitle,
              extractedAuthor: extractedAuthor,
              pdfPath: pdfPath,
              audio_path: audio_path,
              favorite: favorite,
              currentPositionAudio: currentPositionAudio,
              ytCode: ytCode,
              currentPage: currentPage,
              volumeInfo: _volumeInfo?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'volumeInfo';
        _volumeInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Book', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
