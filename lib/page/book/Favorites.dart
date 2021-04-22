import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/book/widget/BookList.dart';

class Favorites extends StatefulWidget {
  @override
  FavoritesState createState() {
    return FavoritesState();
  }
}

class FavoritesState extends State<Favorites> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child:BookList(onlyFavorites: true,)
      ),
    );
  }
}
