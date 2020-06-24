import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/livro/widget/ListaLivro.dart';

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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child:ListaLivro()
      ),
    );
  }
}
