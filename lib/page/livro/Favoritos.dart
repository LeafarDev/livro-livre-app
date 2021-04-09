import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/livro/widget/ListaLivro.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child:ListaLivro(apenasFavoritos: true,)
      ),
    );
  }
}
