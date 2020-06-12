// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book.dart';

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
    if (object.publisher != null) {
      result
        ..add('Publisher')
        ..add(serializers.serialize(object.publisher,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Publisher)])));
    }
    if (object.pagination != null) {
      result
        ..add('pagination')
        ..add(serializers.serialize(object.pagination,
            specifiedType: const FullType(String)));
    }
    if (object.identifier != null) {
      result
        ..add('Identifier')
        ..add(serializers.serialize(object.identifier,
            specifiedType: const FullType(Identifier)));
    }
    if (object.classifications != null) {
      result
        ..add('classifications')
        ..add(serializers.serialize(object.classifications,
            specifiedType: const FullType(Classifications)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.pdf_url != null) {
      result
        ..add('pdf_url')
        ..add(serializers.serialize(object.pdf_url,
            specifiedType: const FullType(String)));
    }
    if (object.audio_url != null) {
      result
        ..add('audio_url')
        ..add(serializers.serialize(object.audio_url,
            specifiedType: const FullType(String)));
    }
    if (object.notes != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(object.notes,
            specifiedType: const FullType(String)));
    }
    if (object.numberOfPages != null) {
      result
        ..add('number_of_pages')
        ..add(serializers.serialize(object.numberOfPages,
            specifiedType: const FullType(int)));
    }
    if (object.cover != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(object.cover,
            specifiedType: const FullType(Cover)));
    }
    if (object.publishDate != null) {
      result
        ..add('publish_date')
        ..add(serializers.serialize(object.publishDate,
            specifiedType: const FullType(String)));
    }
    if (object.key != null) {
      result
        ..add('key')
        ..add(serializers.serialize(object.key,
            specifiedType: const FullType(String)));
    }
    if (object.author != null) {
      result
        ..add('Author')
        ..add(serializers.serialize(object.author,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Author)])));
    }
    if (object.byStatement != null) {
      result
        ..add('by_statement')
        ..add(serializers.serialize(object.byStatement,
            specifiedType: const FullType(String)));
    }
    if (object.publishPlace != null) {
      result
        ..add('publish_places')
        ..add(serializers.serialize(object.publishPlace,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PublishPlace)])));
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
        case 'Publisher':
          result.publisher.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Publisher)]))
              as BuiltList<dynamic>);
          break;
        case 'pagination':
          result.pagination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Identifier':
          result.identifier.replace(serializers.deserialize(value,
              specifiedType: const FullType(Identifier)) as Identifier);
          break;
        case 'classifications':
          result.classifications.replace(serializers.deserialize(value,
                  specifiedType: const FullType(Classifications))
              as Classifications);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pdf_url':
          result.pdf_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audio_url':
          result.audio_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number_of_pages':
          result.numberOfPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cover':
          result.cover.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cover)) as Cover);
          break;
        case 'publish_date':
          result.publishDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Author)]))
              as BuiltList<dynamic>);
          break;
        case 'by_statement':
          result.byStatement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publish_places':
          result.publishPlace.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PublishPlace)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Book extends Book {
  @override
  final BuiltList<Publisher> publisher;
  @override
  final String pagination;
  @override
  final Identifier identifier;
  @override
  final Classifications classifications;
  @override
  final String title;
  @override
  final String url;
  @override
  final String pdf_url;
  @override
  final String audio_url;
  @override
  final String notes;
  @override
  final int numberOfPages;
  @override
  final Cover cover;
  @override
  final String publishDate;
  @override
  final String key;
  @override
  final BuiltList<Author> author;
  @override
  final String byStatement;
  @override
  final BuiltList<PublishPlace> publishPlace;

  factory _$Book([void Function(BookBuilder) updates]) =>
      (new BookBuilder()..update(updates)).build();

  _$Book._(
      {this.publisher,
      this.pagination,
      this.identifier,
      this.classifications,
      this.title,
      this.url,
      this.pdf_url,
      this.audio_url,
      this.notes,
      this.numberOfPages,
      this.cover,
      this.publishDate,
      this.key,
      this.author,
      this.byStatement,
      this.publishPlace})
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
        publisher == other.publisher &&
        pagination == other.pagination &&
        identifier == other.identifier &&
        classifications == other.classifications &&
        title == other.title &&
        url == other.url &&
        pdf_url == other.pdf_url &&
        audio_url == other.audio_url &&
        notes == other.notes &&
        numberOfPages == other.numberOfPages &&
        cover == other.cover &&
        publishDate == other.publishDate &&
        key == other.key &&
        author == other.author &&
        byStatement == other.byStatement &&
        publishPlace == other.publishPlace;
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
                                                                    0,
                                                                    publisher
                                                                        .hashCode),
                                                                pagination
                                                                    .hashCode),
                                                            identifier
                                                                .hashCode),
                                                        classifications
                                                            .hashCode),
                                                    title.hashCode),
                                                url.hashCode),
                                            pdf_url.hashCode),
                                        audio_url.hashCode),
                                    notes.hashCode),
                                numberOfPages.hashCode),
                            cover.hashCode),
                        publishDate.hashCode),
                    key.hashCode),
                author.hashCode),
            byStatement.hashCode),
        publishPlace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Book')
          ..add('publisher', publisher)
          ..add('pagination', pagination)
          ..add('identifier', identifier)
          ..add('classifications', classifications)
          ..add('title', title)
          ..add('url', url)
          ..add('pdf_url', pdf_url)
          ..add('audio_url', audio_url)
          ..add('notes', notes)
          ..add('numberOfPages', numberOfPages)
          ..add('cover', cover)
          ..add('publishDate', publishDate)
          ..add('key', key)
          ..add('author', author)
          ..add('byStatement', byStatement)
          ..add('publishPlace', publishPlace))
        .toString();
  }
}

class BookBuilder implements Builder<Book, BookBuilder> {
  _$Book _$v;

  ListBuilder<Publisher> _publisher;
  ListBuilder<Publisher> get publisher =>
      _$this._publisher ??= new ListBuilder<Publisher>();
  set publisher(ListBuilder<Publisher> publisher) =>
      _$this._publisher = publisher;

  String _pagination;
  String get pagination => _$this._pagination;
  set pagination(String pagination) => _$this._pagination = pagination;

  IdentifierBuilder _identifier;
  IdentifierBuilder get identifier =>
      _$this._identifier ??= new IdentifierBuilder();
  set identifier(IdentifierBuilder identifier) =>
      _$this._identifier = identifier;

  ClassificationsBuilder _classifications;
  ClassificationsBuilder get classifications =>
      _$this._classifications ??= new ClassificationsBuilder();
  set classifications(ClassificationsBuilder classifications) =>
      _$this._classifications = classifications;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _pdf_url;
  String get pdf_url => _$this._pdf_url;
  set pdf_url(String pdf_url) => _$this._pdf_url = pdf_url;

  String _audio_url;
  String get audio_url => _$this._audio_url;
  set audio_url(String audio_url) => _$this._audio_url = audio_url;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  int _numberOfPages;
  int get numberOfPages => _$this._numberOfPages;
  set numberOfPages(int numberOfPages) => _$this._numberOfPages = numberOfPages;

  CoverBuilder _cover;
  CoverBuilder get cover => _$this._cover ??= new CoverBuilder();
  set cover(CoverBuilder cover) => _$this._cover = cover;

  String _publishDate;
  String get publishDate => _$this._publishDate;
  set publishDate(String publishDate) => _$this._publishDate = publishDate;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  ListBuilder<Author> _author;
  ListBuilder<Author> get author =>
      _$this._author ??= new ListBuilder<Author>();
  set author(ListBuilder<Author> author) => _$this._author = author;

  String _byStatement;
  String get byStatement => _$this._byStatement;
  set byStatement(String byStatement) => _$this._byStatement = byStatement;

  ListBuilder<PublishPlace> _publishPlace;
  ListBuilder<PublishPlace> get publishPlace =>
      _$this._publishPlace ??= new ListBuilder<PublishPlace>();
  set publishPlace(ListBuilder<PublishPlace> publishPlace) =>
      _$this._publishPlace = publishPlace;

  BookBuilder();

  BookBuilder get _$this {
    if (_$v != null) {
      _publisher = _$v.publisher?.toBuilder();
      _pagination = _$v.pagination;
      _identifier = _$v.identifier?.toBuilder();
      _classifications = _$v.classifications?.toBuilder();
      _title = _$v.title;
      _url = _$v.url;
      _pdf_url = _$v.pdf_url;
      _audio_url = _$v.audio_url;
      _notes = _$v.notes;
      _numberOfPages = _$v.numberOfPages;
      _cover = _$v.cover?.toBuilder();
      _publishDate = _$v.publishDate;
      _key = _$v.key;
      _author = _$v.author?.toBuilder();
      _byStatement = _$v.byStatement;
      _publishPlace = _$v.publishPlace?.toBuilder();
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
              publisher: _publisher?.build(),
              pagination: pagination,
              identifier: _identifier?.build(),
              classifications: _classifications?.build(),
              title: title,
              url: url,
              pdf_url: pdf_url,
              audio_url: audio_url,
              notes: notes,
              numberOfPages: numberOfPages,
              cover: _cover?.build(),
              publishDate: publishDate,
              key: key,
              author: _author?.build(),
              byStatement: byStatement,
              publishPlace: _publishPlace?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'publisher';
        _publisher?.build();

        _$failedField = 'identifier';
        _identifier?.build();
        _$failedField = 'classifications';
        _classifications?.build();

        _$failedField = 'cover';
        _cover?.build();

        _$failedField = 'author';
        _author?.build();

        _$failedField = 'publishPlace';
        _publishPlace?.build();
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
