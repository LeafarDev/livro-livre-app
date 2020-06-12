// GENERATED CODE - DO NOT MODIFY BY HAND

part of volume_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VolumeInfo> _$volumeInfoSerializer = new _$VolumeInfoSerializer();

class _$VolumeInfoSerializer implements StructuredSerializer<VolumeInfo> {
  @override
  final Iterable<Type> types = const [VolumeInfo, _$VolumeInfo];
  @override
  final String wireName = 'VolumeInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, VolumeInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.subtitle != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(object.subtitle,
            specifiedType: const FullType(String)));
    }
    if (object.authors != null) {
      result
        ..add('authors')
        ..add(serializers.serialize(object.authors,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.publisher != null) {
      result
        ..add('publisher')
        ..add(serializers.serialize(object.publisher,
            specifiedType: const FullType(String)));
    }
    if (object.publishedDate != null) {
      result
        ..add('publishedDate')
        ..add(serializers.serialize(object.publishedDate,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.pageCount != null) {
      result
        ..add('pageCount')
        ..add(serializers.serialize(object.pageCount,
            specifiedType: const FullType(int)));
    }
    if (object.printType != null) {
      result
        ..add('printType')
        ..add(serializers.serialize(object.printType,
            specifiedType: const FullType(String)));
    }
    if (object.categories != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(object.categories,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.maturityRating != null) {
      result
        ..add('maturityRating')
        ..add(serializers.serialize(object.maturityRating,
            specifiedType: const FullType(String)));
    }
    if (object.allowAnonLogging != null) {
      result
        ..add('allowAnonLogging')
        ..add(serializers.serialize(object.allowAnonLogging,
            specifiedType: const FullType(bool)));
    }
    if (object.contentVersion != null) {
      result
        ..add('contentVersion')
        ..add(serializers.serialize(object.contentVersion,
            specifiedType: const FullType(String)));
    }
    if (object.imageLinks != null) {
      result
        ..add('imageLinks')
        ..add(serializers.serialize(object.imageLinks,
            specifiedType: const FullType(ImageLinks)));
    }
    if (object.language != null) {
      result
        ..add('language')
        ..add(serializers.serialize(object.language,
            specifiedType: const FullType(String)));
    }
    if (object.previewLink != null) {
      result
        ..add('previewLink')
        ..add(serializers.serialize(object.previewLink,
            specifiedType: const FullType(String)));
    }
    if (object.infoLink != null) {
      result
        ..add('infoLink')
        ..add(serializers.serialize(object.infoLink,
            specifiedType: const FullType(String)));
    }
    if (object.canonicalVolumeLink != null) {
      result
        ..add('canonicalVolumeLink')
        ..add(serializers.serialize(object.canonicalVolumeLink,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VolumeInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VolumeInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authors':
          result.authors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'publisher':
          result.publisher = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publishedDate':
          result.publishedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pageCount':
          result.pageCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'printType':
          result.printType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'maturityRating':
          result.maturityRating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'allowAnonLogging':
          result.allowAnonLogging = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'contentVersion':
          result.contentVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageLinks':
          result.imageLinks.replace(serializers.deserialize(value,
              specifiedType: const FullType(ImageLinks)) as ImageLinks);
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previewLink':
          result.previewLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infoLink':
          result.infoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'canonicalVolumeLink':
          result.canonicalVolumeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VolumeInfo extends VolumeInfo {
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final BuiltList<String> authors;
  @override
  final String publisher;
  @override
  final String publishedDate;
  @override
  final String description;
  @override
  final int pageCount;
  @override
  final String printType;
  @override
  final BuiltList<String> categories;
  @override
  final String maturityRating;
  @override
  final bool allowAnonLogging;
  @override
  final String contentVersion;
  @override
  final ImageLinks imageLinks;
  @override
  final String language;
  @override
  final String previewLink;
  @override
  final String infoLink;
  @override
  final String canonicalVolumeLink;

  factory _$VolumeInfo([void Function(VolumeInfoBuilder) updates]) =>
      (new VolumeInfoBuilder()..update(updates)).build();

  _$VolumeInfo._(
      {this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink})
      : super._();

  @override
  VolumeInfo rebuild(void Function(VolumeInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VolumeInfoBuilder toBuilder() => new VolumeInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VolumeInfo &&
        title == other.title &&
        subtitle == other.subtitle &&
        authors == other.authors &&
        publisher == other.publisher &&
        publishedDate == other.publishedDate &&
        description == other.description &&
        pageCount == other.pageCount &&
        printType == other.printType &&
        categories == other.categories &&
        maturityRating == other.maturityRating &&
        allowAnonLogging == other.allowAnonLogging &&
        contentVersion == other.contentVersion &&
        imageLinks == other.imageLinks &&
        language == other.language &&
        previewLink == other.previewLink &&
        infoLink == other.infoLink &&
        canonicalVolumeLink == other.canonicalVolumeLink;
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        title
                                                                            .hashCode),
                                                                    subtitle
                                                                        .hashCode),
                                                                authors
                                                                    .hashCode),
                                                            publisher.hashCode),
                                                        publishedDate.hashCode),
                                                    description.hashCode),
                                                pageCount.hashCode),
                                            printType.hashCode),
                                        categories.hashCode),
                                    maturityRating.hashCode),
                                allowAnonLogging.hashCode),
                            contentVersion.hashCode),
                        imageLinks.hashCode),
                    language.hashCode),
                previewLink.hashCode),
            infoLink.hashCode),
        canonicalVolumeLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VolumeInfo')
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('authors', authors)
          ..add('publisher', publisher)
          ..add('publishedDate', publishedDate)
          ..add('description', description)
          ..add('pageCount', pageCount)
          ..add('printType', printType)
          ..add('categories', categories)
          ..add('maturityRating', maturityRating)
          ..add('allowAnonLogging', allowAnonLogging)
          ..add('contentVersion', contentVersion)
          ..add('imageLinks', imageLinks)
          ..add('language', language)
          ..add('previewLink', previewLink)
          ..add('infoLink', infoLink)
          ..add('canonicalVolumeLink', canonicalVolumeLink))
        .toString();
  }
}

class VolumeInfoBuilder implements Builder<VolumeInfo, VolumeInfoBuilder> {
  _$VolumeInfo _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _subtitle;
  String get subtitle => _$this._subtitle;
  set subtitle(String subtitle) => _$this._subtitle = subtitle;

  ListBuilder<String> _authors;
  ListBuilder<String> get authors =>
      _$this._authors ??= new ListBuilder<String>();
  set authors(ListBuilder<String> authors) => _$this._authors = authors;

  String _publisher;
  String get publisher => _$this._publisher;
  set publisher(String publisher) => _$this._publisher = publisher;

  String _publishedDate;
  String get publishedDate => _$this._publishedDate;
  set publishedDate(String publishedDate) =>
      _$this._publishedDate = publishedDate;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _pageCount;
  int get pageCount => _$this._pageCount;
  set pageCount(int pageCount) => _$this._pageCount = pageCount;

  String _printType;
  String get printType => _$this._printType;
  set printType(String printType) => _$this._printType = printType;

  ListBuilder<String> _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String> categories) =>
      _$this._categories = categories;

  String _maturityRating;
  String get maturityRating => _$this._maturityRating;
  set maturityRating(String maturityRating) =>
      _$this._maturityRating = maturityRating;

  bool _allowAnonLogging;
  bool get allowAnonLogging => _$this._allowAnonLogging;
  set allowAnonLogging(bool allowAnonLogging) =>
      _$this._allowAnonLogging = allowAnonLogging;

  String _contentVersion;
  String get contentVersion => _$this._contentVersion;
  set contentVersion(String contentVersion) =>
      _$this._contentVersion = contentVersion;

  ImageLinksBuilder _imageLinks;
  ImageLinksBuilder get imageLinks =>
      _$this._imageLinks ??= new ImageLinksBuilder();
  set imageLinks(ImageLinksBuilder imageLinks) =>
      _$this._imageLinks = imageLinks;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  String _previewLink;
  String get previewLink => _$this._previewLink;
  set previewLink(String previewLink) => _$this._previewLink = previewLink;

  String _infoLink;
  String get infoLink => _$this._infoLink;
  set infoLink(String infoLink) => _$this._infoLink = infoLink;

  String _canonicalVolumeLink;
  String get canonicalVolumeLink => _$this._canonicalVolumeLink;
  set canonicalVolumeLink(String canonicalVolumeLink) =>
      _$this._canonicalVolumeLink = canonicalVolumeLink;

  VolumeInfoBuilder();

  VolumeInfoBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _subtitle = _$v.subtitle;
      _authors = _$v.authors?.toBuilder();
      _publisher = _$v.publisher;
      _publishedDate = _$v.publishedDate;
      _description = _$v.description;
      _pageCount = _$v.pageCount;
      _printType = _$v.printType;
      _categories = _$v.categories?.toBuilder();
      _maturityRating = _$v.maturityRating;
      _allowAnonLogging = _$v.allowAnonLogging;
      _contentVersion = _$v.contentVersion;
      _imageLinks = _$v.imageLinks?.toBuilder();
      _language = _$v.language;
      _previewLink = _$v.previewLink;
      _infoLink = _$v.infoLink;
      _canonicalVolumeLink = _$v.canonicalVolumeLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VolumeInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VolumeInfo;
  }

  @override
  void update(void Function(VolumeInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VolumeInfo build() {
    _$VolumeInfo _$result;
    try {
      _$result = _$v ??
          new _$VolumeInfo._(
              title: title,
              subtitle: subtitle,
              authors: _authors?.build(),
              publisher: publisher,
              publishedDate: publishedDate,
              description: description,
              pageCount: pageCount,
              printType: printType,
              categories: _categories?.build(),
              maturityRating: maturityRating,
              allowAnonLogging: allowAnonLogging,
              contentVersion: contentVersion,
              imageLinks: _imageLinks?.build(),
              language: language,
              previewLink: previewLink,
              infoLink: infoLink,
              canonicalVolumeLink: canonicalVolumeLink);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authors';
        _authors?.build();

        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'imageLinks';
        _imageLinks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VolumeInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
