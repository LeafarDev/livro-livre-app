import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/livro/Repository.dart';
import 'package:livro_livre_app/page/livro/widget/LivroItem.dart';
import 'package:loading_more_list/loading_more_list.dart';

class Favoritos extends StatefulWidget {
  @override
  FavoritosState createState() {
    return FavoritosState();
  }
}

class FavoritosState extends State<Favoritos> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return Scaffold(
        body: SafeArea(
        child: Container(
          child: LoadingMoreList(
            ListConfig<LivroItem>(
              itemBuilder: (BuildContext context, LivroItem item, int index) {
                return item;
              },
              sourceList: repository,
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
      ),
    );
  }
}
