import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/book/widget/BookList.dart';

class Books extends StatefulWidget {
  @override
  BooksState createState() {
    return BooksState();
  }
}

class BooksState extends State<Books> {

  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:BookList(onlyFavorites: false,)
      ),
    );
  }
}
