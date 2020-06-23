import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:livro_livre_app/redux/app_state.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../Repository.dart';
import 'LivroItem.dart';

class ListaLivro extends StatelessWidget {
  Repository _repository;

  ListaLivro(this._repository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Expanded(
      key: UniqueKey(),
      child: StoreConnector<AppState, AppState>(
          distinct: true,
          converter: (store) => store.state,
          rebuildOnChange: true,
          builder: (context, state) {
            print(state.selectedCategorias);
            return LoadingMoreList(
              ListConfig<LivroItem>(
                itemBuilder: (BuildContext context, LivroItem item, int index) {
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
            );
          }),
    );
  }
}
