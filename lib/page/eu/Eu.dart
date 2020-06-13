import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/api/LivroApi.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/util/ramdom.dart';
import 'package:sqflite/sqflite.dart';

class Eu extends StatefulWidget {
  @override
  EuState createState() {
    return EuState();
  }
}

class EuState extends State<Eu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FlatButton(
        color: Colors.red,
        child: Text('SqlLite'),
        onPressed: () async {
          var db = await openDatabase('projeto_livro_livre.db');
          /* await db.execute(
            'drop table book;');
          List<Map> result = await db.rawQuery('SELECT * FROM book');
            print(result);*/
          await db.execute('drop table book;');
          LivroDatabase().createDatabase();
          reload();
        },
      ),
    );
  }

  var _listaLivro = [];
  var i = 0;

  reload() async {
    // PRECISO SALVAR CATEGORIA DO LIVRO NO BANCO
    // CARREGAR DO DATABASE PRA N FICAR PINGANDO NO SITE
    // ARRUMAR DESIGN DA LISTA DE LIVRO
    if (_listaLivro.isEmpty) {
      _listaLivro = await LivroApi().getAll();
    }
    /* if (_listaLivrosTexto != null) {
      _listaLivro = jsonDecode(_listaLivrosTexto);
      print(_listaLivro);
    } else {
      LivroApi().getAll();
    } */
    print("loadData");
    print("I cant Love u anymore - " + i.toString());
    if (_listaLivro.isNotEmpty) {
      for (var i = 0; i < _listaLivro.length; i++) {
        Book book;
        // verifico se já existe no banco, caso não, insiro
        var existe = await LivroDatabase().chechIfBookExists(_listaLivro[i][2]);
        print("existe ? =>" + existe.toString());
        if (existe == false) {
          // busca infos do livro no google api
          book = await LivroApi()
              .googleBooksApi(_listaLivro[i][1], _listaLivro[i][0]);
          // Só mostro se houver resultado
          if (book != null) {
            // adiciona link do pdf e referencia do audio se houver
            var bookObj = jsonDecode(book.toJson());
            bookObj["extracted_title"] = _listaLivro[i][1];
            bookObj["extracted_author"] = _listaLivro[i][0];
            bookObj["pdfLink"] = _listaLivro[i][2];
            bookObj["audioLink"] = _listaLivro[i][3];
            book = Book.fromJson(jsonEncode(bookObj));
            jsonEncode(
                {"pdfLink": _listaLivro[i][2], "audioLink": _listaLivro[i][3]});
          } else {
            // book padrao, caso não haja no google api
            book = Book.fromJson(jsonEncode({
              "id": RandomString(12),
              "pdfLink": _listaLivro[i][2],
              "audioLink": _listaLivro[i][3],
              "extracted_title": _listaLivro[i][1],
              "extracted_author": _listaLivro[i][0],
              "volumeInfo": {
                "title": _listaLivro[i][1],
                "authors": [_listaLivro[i][0]]
              }
            }));
          }
          var inserrt = await LivroDatabase().insert(book.toSqlFormat());
          print("chegou no insert" + inserrt.toString());
        }
      }
    } else {
      print("has no more ${_listaLivro.length}");
    }

    return true;
  }
}
