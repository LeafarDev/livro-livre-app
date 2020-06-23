import 'dart:async';

import 'package:edit_distance/edit_distance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/page/livro/Repository.dart';
import 'package:livro_livre_app/page/livro/widget/LivroItem.dart';
import 'package:loading_more_list/loading_more_list.dart';

class Livros extends StatefulWidget {
  @override
  LivrosState createState() {
    return LivrosState();
  }
}

class LivrosState extends State<Livros> {
  initState() {
    super.initState();
  }

  Repository _repository = Repository();
  TextEditingController _textFieldController = TextEditingController();
  String _lastSearch = "";
  FocusNode _focusNode = FocusNode();
  bool showFilters = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _inputSearch(),
            if (showFilters)
              Row(children: <Widget>[],),
            Expanded(
              child: LoadingMoreList(
                ListConfig<LivroItem>(
                  itemBuilder:
                      (BuildContext context, LivroItem item, int index) {
                    return item;
                  },
                  sourceList: _repository,
                  padding: EdgeInsets.all(0.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * 0.25),
                    crossAxisCount: 1,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _inputSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: MediaQuery.of(context).size.height * 0.06,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 25.0,
            color: Colors.black,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _textFieldController,
              focusNode: _focusNode,
              onChanged: (value) {
                _repository.loadData(true,_textFieldController.value.text);
                setState(() {
                  _lastSearch = _textFieldController.value.text;
                });
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Darude - Sandstorm',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 25.0,
            color: Colors.black,
            onPressed: () {
              //[bool isloadMoreAction = false,
              //      text = "",
              //      categoria = "",
              //      apenasFavorito = false]_repository.loadData(false,_textFieldController.value.text);
              //_textFieldController.value.text
              // _textFieldController.clear();

            },
          ),
        ],
      ),
    );
  }

}
