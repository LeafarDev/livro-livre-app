import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livro_livre_app/api/LivroApi.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository extends LoadingMoreBase<Card> {
  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  var _listaLivro = [];
  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    final prefs = await SharedPreferences.getInstance();
    var _listaLivrosTexto = prefs.get("cat-romance") ?? null;
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
    print("I cant Love u anymore - " + length.toString());
    if (_listaLivro.isNotEmpty && _listaLivro.length > length) {
      LivroApi().openLibraryBookInfo(_listaLivro[length][1], _listaLivro[length][0]);
      add(Card(
        child: Text(_listaLivro[length][1]),
        color: length % 2 == 1 ? Colors.amber : Colors.redAccent,
      ));
    } else {
      print("has no more ${_listaLivro.length}");
      _hasMore = false;
    }
    pageindex++;
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    return true;
  }
}
