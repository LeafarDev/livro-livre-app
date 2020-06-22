import 'dart:async';

import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/page/livro/widget/LivroItem.dart';
import 'package:loading_more_list/loading_more_list.dart';

class Repository extends LoadingMoreBase<LivroItem> {
  var _apenasFavoritos = false;

  Repository({apenasFavoritos = false}) {
    _apenasFavoritos = apenasFavoritos;
  }

  bool _hasMore = true;
  bool forceRefresh = false;
  var _listaLivro = [];

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    List<Book> books = await LivroDatabase().all();

    if (_apenasFavoritos == true) {
      books = books.where((b) => b.favorite == true).toList();
    }

    if (books.isNotEmpty && books.length > length) {
      Book book =
          await LivroDatabase().getByPdfLink(books[length].pdfLink) as Book;
      add(LivroItem(book));
    } else {
      print("has no more ${_listaLivro.length}");
      _hasMore = false;
    }
    return true;
  }
}
