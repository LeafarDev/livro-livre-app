import 'dart:async';

import 'package:edit_distance/edit_distance.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/page/livro/widget/LivroItem.dart';
import 'package:loading_more_list/loading_more_list.dart';

class Repository extends LoadingMoreBase<LivroItem> {
  var _apenasFavoritos = false;
  var lastSearch = null;

  Repository({apenasFavoritos = false}) {
    _apenasFavoritos = apenasFavoritos;
  }

  bool _hasMore = true;
  bool forceRefresh = false;
  var _listaLivro = [];

  @override
  bool get hasMore => _hasMore || forceRefresh;
  var conta = 0;

  _doSearch({text = "", categoria = "", apenasFavorito = false}) async {
    var books = await LivroDatabase().all();
    books = await books.where((item) {
      int levenstein = 1;
      if (apenasFavorito == true && item.favorite == false) {
        return false;
      }
      if (categoria != "" && categoria != item.categoria) {
        return false;
      }
      if (text != "") {
        LongestCommonSubsequence d = new LongestCommonSubsequence();
        // verificando aproximidade do titulo
        var titleDistance = d.distance(text, item.extractedTitle);
        var authorDistance = d.distance(text, item.extractedAuthor);
        if (titleDistance <= authorDistance) {
          levenstein = titleDistance;
        } else {
          levenstein = authorDistance;
        }
        if (levenstein <= 10) {
          /* print("levenstein author:::" +
              authorDistance.toString() +
              "/" +
              titleDistance.toString() +
              "::" +
              item.extractedAuthor +
              "/" +
              item.extractedTitle); */
        }
      }
      if (levenstein <= 10) {
        return true;
      }
      return false;
    }).toList();
    return books;
  }

  @override
  Future<bool> loadData(
      [bool isloadMoreAction = false,
      text = "",
      categoria = "",
      apenasFavorito = false]) async {
    if(lastSearch != text) {
      clear();
      lastSearch = text;
    }
    var books = await _doSearch(
        text: text, categoria: categoria, apenasFavorito: apenasFavorito);
    while (length < books.length) {
      Book book =
      await LivroDatabase().getByPdfLink(books[length].pdfLink) as Book;
      add(LivroItem(book));
      setState();
    }
    if (books.isEmpty || books.length == length) {
      print("has no more ${_listaLivro.length}");
      _hasMore = false;
    }

    return true;
  }
}
