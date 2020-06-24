import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("aaa"),
          ),
        ),
      ),
    );
  }
}
