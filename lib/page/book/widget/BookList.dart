import 'package:edit_distance/edit_distance.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:livro_livre_app/database/BookDatabase.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/app_state.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'BookWidgetItem.dart';

class BookList extends StatefulWidget {
  bool onlyFavorites = false;

  BookList({this.onlyFavorites});

  @override
  BookListState createState() {
    return BookListState(onlyFavorites);
  }
}

class BookListState extends State<BookList> {
  bool _onlyFavorites = false;
  final _key = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool updating = true;

  BookListState(this._onlyFavorites);

  @override
  void initState() {
    super.initState();
    _doSearch(
        text: "",
        categories: store.state.selectedCategories,
        apenasFavorito: _onlyFavorites);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: StoreConnector<AppState, AppState>(
          distinct: true,
          converter: (store) => store.state,
          builder: (context, state) {
            print("rebuild" + state.currentBookList.length.toString());
            return Column(
              children: <Widget>[
                _inputSearch(context),
                if (state.currentBookList.length == 0 || updating)
                  Expanded(
                    child: Center(
                      child: Text(
                        "Sem Resultados",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                if (state.currentBookList.length > 0 && updating == false)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: ListView.builder(
                        itemCount: state.currentBookList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: BookWidgetItem(state.currentBookList[index]),
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
    if (store.state.selectedCategories == null) {
      store.dispatch(setSelectedCategories(store.state.categories));
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
                    categories: store.state.selectedCategories,
                    apenasFavorito: _onlyFavorites);
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
              //      category = "",
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
    print("selected >> ${store.state.selectedCategories}");

    await FilterListDialog.display(
      context,
      listData: store.state.categories,
      applyButonTextBackgroundColor: Colors.orangeAccent,
      height: 450,
      borderRadius: 20,
      headlineText: "Selecione as categories",
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
            store.dispatch(setSelectedCategories(List.from(list)));
          });
          await _doSearch(
              text: "",
              categories: store.state.selectedCategories,
              apenasFavorito: _onlyFavorites);
        }
        Navigator.pop(context);
      },
      selectedListData: store.state.selectedCategories,
      validateSelectedItem: (list, val) {
        return list.contains(val);
      },
    );
    // if (list != null) {
    //   store.dispatch(setSelectedCategories(List.from(list)));
    //   await _doSearch(
    //       text: "",
    //       categories: store.state.selectedCategorias,
    //       apenasFavorito: _onlyFavorites);
    // }
  }

  _doSearch({text = "", categories = null, apenasFavorito = false}) async {
    print("pesquisando,,, ${apenasFavorito} ");
    setState(() {
      updating = true;
    });
    var books = await BookDatabase().all();
    books = await books.where((item) {
      int levenstein = 1;
      if (apenasFavorito == true && item.favorite != true) {
        return false;
      } else {
        print("${apenasFavorito} >>>>>>>>>>>>${item.favorite}" +
            "${item.extractedTitle}");
      }
      if (categories != null) {
        var categorySearch = categories.where((category) {
          if (item.category == category) {
            return true;
          }
          return false;
        });
        if (categorySearch.length == 0) {
          return false;
        }
      }
      if (text != "") {
        LongestCommonSubsequence d = new LongestCommonSubsequence();
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
    store.dispatch(setCurrentBooksList(books));
    print("pesquisado" + books.length.toString());
    setState(() {
      updating = false;
    });
  }
}