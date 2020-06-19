import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/page/livro/widget/LivroItem.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';
import 'package:loading_more_list/loading_more_list.dart';

class Repository extends LoadingMoreBase<Container> {
  var _context;

  Repository(context) {
    _context = context;
  }

  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  var _listaLivro = [];

  @override
  bool get hasMore => _hasMore || forceRefresh;



  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    // PRECISO SALVAR CATEGORIA DO LIVRO NO BANCO
    // CARREGAR DO DATABASE PRA N FICAR PINGANDO NO SITE
    // ARRUMAR DESIGN DA LISTA DE LIVRO
    List<Book> books = await LivroDatabase().all();
    if (books.isNotEmpty && books.length > length) {
      Book book =
          await LivroDatabase().getByPdfLink(books[length].pdfLink) as Book;
      add(LivroItem(book).build(locator<NavigationService>()
          .navigatorKey
          .currentState
          .overlay
          .context));
    } else {
      print("has no more ${_listaLivro.length}");
      _hasMore = false;
    }
    pageindex++;
    return true;
  }


}
