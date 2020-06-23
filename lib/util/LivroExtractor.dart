import 'dart:convert';

import 'package:livro_livre_app/api/LivroApi.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/CategoriaLivroExtractor.dart';
import 'package:livro_livre_app/util/ramdom.dart';

class LivroExtractor {
  var _listaLivro = [];

  processarExtracaoLivro() async {
    // PRECISO DEFINIR A PERIODICIDADE DA EXTRAÇÃO DO SITE
    if (_listaLivro.isEmpty) {
      var categorias = store.state.categorias;
      print("loadData");
      for (var i = 0; i < categorias.length; i++) {
        processarExtracaoLivroCategoria(categorias[i]);
      }
    }
    return true;
  }

  Future processarExtracaoLivroCategoria(String categoria) async {
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${categoria}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    var listaLivro = await CategoriaLivroExtractor()
        .extrairLivrosPorCategoria(categoria: categoria);
    if (listaLivro.isNotEmpty) {
      for (var j = 0; j < listaLivro.length; j++) {
        preparacaoEInsertDados(listaLivro[j], categoria);
      }
    } else {
      print("has no more ${listaLivro.length}");
    }
  }

  Future preparacaoEInsertDados(livroExtraido, String categoria) async {
    var existe = await LivroDatabase().chechIfBookExists(livroExtraido[2]);
    print("existe ? =>" + existe.toString());
    if (existe == false) {
      var book =
      await LivroApi().googleBooksApi(livroExtraido[1], livroExtraido[0]);
      if (book != null) {
        // adiciona link do pdf e referencia do audio se houver
        var bookObj = jsonDecode(book.toJson());
        bookObj["extracted_title"] = livroExtraido[1];
        bookObj["categoria"] = categoria;
        bookObj["extracted_author"] = livroExtraido[0];
        bookObj["pdfLink"] = livroExtraido[2];
        bookObj["ytCode"] = livroExtraido[3];
        book = Book.fromJson(jsonEncode(bookObj));
        jsonEncode({"pdfLink": livroExtraido[2], "ytCode": livroExtraido[3]});
      } else {
        // book padrao, caso não haja no google api
        book = Book.fromJson(jsonEncode({
          "id": RandomString(12),
          "categoria": categoria,
          "pdfLink": livroExtraido[2],
          "ytCode": livroExtraido[3],
          "extracted_title": livroExtraido[1],
          "extracted_author": livroExtraido[0],
          "volumeInfo": {
            "title": livroExtraido[1],
            "authors": [livroExtraido[0]]
          }
        }));
      }
      var inserrt = await LivroDatabase().insert(book.toSqlFormat());
      print("chegou no insert" + inserrt.toString());
    }
  }
}
