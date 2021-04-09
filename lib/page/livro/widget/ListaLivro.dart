import 'package:edit_distance/edit_distance.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/app_state.dart';
import 'package:livro_livre_app/redux/store.dart';

import 'LivroItem.dart';

class ListaLivro extends StatefulWidget {
  bool apenasFavoritos = false;

  ListaLivro({this.apenasFavoritos});

  @override
  ListaLivroState createState() {
    return ListaLivroState(apenasFavoritos);
  }
}

class ListaLivroState extends State<ListaLivro> {
  bool _apenasFavoritos = false;
  final _key = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool atualizando = true;

  ListaLivroState(this._apenasFavoritos);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _doSearch(
        text: "",
        categorias: store.state.selectedCategorias,
        apenasFavorito: _apenasFavoritos);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: StoreConnector<AppState, AppState>(
          distinct: true,
          converter: (store) => store.state,
          builder: (context, state) {
            print("rebuild" + state.listaAtualLivros.length.toString());
            return Column(
              children: <Widget>[
                _inputSearch(context),
                if (state.listaAtualLivros.length == 0 || atualizando)
                  Expanded(
                    child: Center(
                      child: Text(
                        "Sem Resultados",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                if (state.listaAtualLivros.length > 0 && atualizando == false)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: ListView.builder(
                        itemCount: state.listaAtualLivros.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: LivroItem(state.listaAtualLivros[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
              ],
            );
          }),
    );
  }

  _inputSearch(context) {
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
              key: _key,
              controller: _textFieldController,
              focusNode: _focusNode,
              onChanged: (value) {
                _doSearch(
                    text: _textFieldController.value.text,
                    categorias: store.state.selectedCategorias,
                    apenasFavorito: _apenasFavoritos);
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
    print("selected >> ${store.state.selectedCategorias}");

    await FilterListDialog.display(
      context,
      listData: store.state.categorias,
      applyButonTextBackgroundColor: Colors.orangeAccent,
      height: 450,
      borderRadius: 20,
      headlineText: "Selecione as categorias",
      searchFieldHintText: "busque aqui",
      label: (item) {
        return item;
      },
      onItemSearch: (list, text) {
        if (list.any(
            (element) => element.toLowerCase().contains(text.toLowerCase()))) {
          return list
              .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
              .toList();
        }
        return [];
      },
      onApplyButtonClick: (list) async {
        if (list != null) {
          setState(() {
            store.dispatch(setSelectedCategorias(List.from(list)));
          });
          await _doSearch(
              text: "",
              categorias: store.state.selectedCategorias,
              apenasFavorito: _apenasFavoritos);
        }
        Navigator.pop(context);
      },
      selectedListData: store.state.selectedCategorias,
      validateSelectedItem: (list, val) {
        return list.contains(val);
      },
    );
    // if (list != null) {
    //   store.dispatch(setSelectedCategorias(List.from(list)));
    //   await _doSearch(
    //       text: "",
    //       categorias: store.state.selectedCategorias,
    //       apenasFavorito: _apenasFavoritos);
    // }
  }

  _doSearch({text = "", categorias = null, apenasFavorito = false}) async {
    print("pesquisando,,, ${apenasFavorito} ");
    setState(() {
      atualizando = true;
    });
    var books = await LivroDatabase().all();
    books = await books.where((item) {
      int levenstein = 1;
      if (apenasFavorito == true && item.favorite != true) {
        return false;
      } else {
        print("${apenasFavorito} >>>>>>>>>>>>${item.favorite}" +
            "${item.extractedTitle}");
      }
      if (categorias != null) {
        var procuraCategoria = categorias.where((categoria) {
          if (item.categoria == categoria) {
            return true;
          }
          return false;
        });
        // print("não achou categorias" + item.categoria);
        if (procuraCategoria.length == 0) {
          return false;
        }
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
        if (item.extractedAuthor == "Machado de Assis") {
          print("levenstein author:::" +
              authorDistance.toString() +
              "/" +
              titleDistance.toString() +
              "::" +
              item.extractedAuthor +
              "/" +
              item.extractedTitle);
        }
      }
      if (levenstein <= 10) {
        return true;
      }
      return false;
    }).toList();
    books.sort((a, b) =>
        a.extractedTitle.toString().compareTo(b.extractedTitle.toString()));
    store.dispatch(setListaAtualLivros(books));
    print("pesquisado" + books.length.toString());
    setState(() {
      atualizando = false;
    });
  }
}
