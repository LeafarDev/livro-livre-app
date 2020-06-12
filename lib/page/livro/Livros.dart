import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/api/LivroApi.dart';
import 'package:livro_livre_app/page/livro/Repository.dart';
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

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista"),
      ),
      body: Container(
        child: LoadingMoreList(
          ListConfig<Card>(
            itemBuilder: (BuildContext context, Card item, int index) {
              return item;
            },
            sourceList: repository,
            padding: EdgeInsets.all(0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 3.0,
            ),
          ),
        ),
      ),
    );
  }

}
