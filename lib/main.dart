import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:livro_livre_app/page/app.dart';
import 'package:livro_livre_app/page/livro/player.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute: '/',
        routes: {'/': (context) => App(), '/player': (context) => Player()},
      ),
    );
  }
}
