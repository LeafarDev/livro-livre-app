import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Repository repository = Repository(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista"),
      ),
      body: Container(
        child: LoadingMoreList(
          ListConfig<Container>(
            itemBuilder: (BuildContext context, Container item, int index) {
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
    );
  }
}
