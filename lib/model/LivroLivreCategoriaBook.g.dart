// GENERATED CODE - DO NOT MODIFY BY HAND

part of categoria_livro;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LivroLivreCategoriaBook> _$livroLivreCategoriaBookSerializer =
    new _$LivroLivreCategoriaBookSerializer();

class _$LivroLivreCategoriaBookSerializer
    implements StructuredSerializer<LivroLivreCategoriaBook> {
  @override
  final Iterable<Type> types = const [
    LivroLivreCategoriaBook,
    _$LivroLivreCategoriaBook
  ];
  @override
  final String wireName = 'LivroLivreCategoriaBook';

  @override
  Iterable<Object> serialize(
      Serializers serializers, LivroLivreCategoriaBook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.nome != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(object.nome,
            specifiedType: const FullType(String)));
    }
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LivroLivreCategoriaBook deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LivroLivreCategoriaBookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LivroLivreCategoriaBook extends LivroLivreCategoriaBook {
  @override
  final String nome;
  @override
  final String link;

  factory _$LivroLivreCategoriaBook(
          [void Function(LivroLivreCategoriaBookBuilder) updates]) =>
      (new LivroLivreCategoriaBookBuilder()..update(updates)).build();

  _$LivroLivreCategoriaBook._({this.nome, this.link}) : super._();

  @override
  LivroLivreCategoriaBook rebuild(
          void Function(LivroLivreCategoriaBookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LivroLivreCategoriaBookBuilder toBuilder() =>
      new LivroLivreCategoriaBookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LivroLivreCategoriaBook &&
        nome == other.nome &&
        link == other.link;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nome.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LivroLivreCategoriaBook')
          ..add('nome', nome)
          ..add('link', link))
        .toString();
  }
}

class LivroLivreCategoriaBookBuilder
    implements
        Builder<LivroLivreCategoriaBook, LivroLivreCategoriaBookBuilder> {
  _$LivroLivreCategoriaBook _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  LivroLivreCategoriaBookBuilder();

  LivroLivreCategoriaBookBuilder get _$this {
    if (_$v != null) {
      _nome = _$v.nome;
      _link = _$v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LivroLivreCategoriaBook other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LivroLivreCategoriaBook;
  }

  @override
  void update(void Function(LivroLivreCategoriaBookBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LivroLivreCategoriaBook build() {
    final _$result =
        _$v ?? new _$LivroLivreCategoriaBook._(nome: nome, link: link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
