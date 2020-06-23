import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/livro/Repository.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/store.dart';

class InputSearch extends StatelessWidget {
  Repository _repository;
  bool _apenasFavoritos = false;

  InputSearch(this._repository, this._apenasFavoritos);

  TextEditingController _textFieldController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (store.state.selectedCategorias == null) {
      store.dispatch(setSelectedCategorias(store.state.categorias));
    }
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
                _repository.loadData(true, _textFieldController.value.text,
                    store.state.selectedCategorias, _apenasFavoritos);
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'informe titulo ou autor',
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
              _openFilterList(context);
            },
          ),
        ],
      ),
    );
  }

  void _openFilterList(context) async {
    print("formula mágica da paz");
    var list = await FilterList.showFilterList(
      context,
      allTextList: store.state.categorias,
      applyButonTextBackgroundColor: Colors.orangeAccent,
      height: 450,
      borderRadius: 20,
      headlineText: "Selecione as categorias",
      searchFieldHintText: "busque aqui",
      selectedTextList: store.state.selectedCategorias,
    );
    if (list != null) {
      store.dispatch(setSelectedCategorias(List.from(list)));
    }
    await _repository.loadData(true, _textFieldController.value.text,
        store.state.selectedCategorias, _apenasFavoritos);
  }
}
