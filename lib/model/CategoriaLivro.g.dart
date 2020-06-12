// GENERATED CODE - DO NOT MODIFY BY HAND

part of categoria_livro;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriaLivro> _$categoriaLivroSerializer =
    new _$CategoriaLivroSerializer();

class _$CategoriaLivroSerializer
    implements StructuredSerializer<CategoriaLivro> {
  @override
  final Iterable<Type> types = const [CategoriaLivro, _$CategoriaLivro];
  @override
  final String wireName = 'CategoriaLivro';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoriaLivro object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'nome',
      serializers.serialize(object.nome, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CategoriaLivro deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriaLivroBuilder();

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

class _$CategoriaLivro extends CategoriaLivro {
  @override
  final String nome;
  @override
  final String link;

  factory _$CategoriaLivro([void Function(CategoriaLivroBuilder) updates]) =>
      (new CategoriaLivroBuilder()..update(updates)).build();

  _$CategoriaLivro._({this.nome, this.link}) : super._() {
    if (nome == null) {
      throw new BuiltValueNullFieldError('CategoriaLivro', 'nome');
    }
    if (link == null) {
      throw new BuiltValueNullFieldError('CategoriaLivro', 'link');
    }
  }

  @override
  CategoriaLivro rebuild(void Function(CategoriaLivroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriaLivroBuilder toBuilder() =>
      new CategoriaLivroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriaLivro && nome == other.nome && link == other.link;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nome.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoriaLivro')
          ..add('nome', nome)
          ..add('link', link))
        .toString();
  }
}

class CategoriaLivroBuilder
    implements Builder<CategoriaLivro, CategoriaLivroBuilder> {
  _$CategoriaLivro _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  CategoriaLivroBuilder();

  CategoriaLivroBuilder get _$this {
    if (_$v != null) {
      _nome = _$v.nome;
      _link = _$v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriaLivro other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoriaLivro;
  }

  @override
  void update(void Function(CategoriaLivroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoriaLivro build() {
    final _$result = _$v ?? new _$CategoriaLivro._(nome: nome, link: link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
