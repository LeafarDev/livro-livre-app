import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/page/Options/Options.dart';

import 'book/Books.dart';
import 'book/Favorites.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    ConnectivityUtils.initialize(
        serverToPing: "https://www.cloudflare.com",
        callback: (response) => response.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    var pages = [Books(), Favorites(), Options()];
    return new WillPopScope(
        onWillPop: () async => false,
        child: ConnectivityWidget(
          offlineBanner: Container(
            alignment: Alignment.topLeft,
            child: Flushbar(
              icon: Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                color: Colors.white,
              ),
              flushbarPosition: FlushbarPosition.TOP,
              title: "Sem conexão",
              backgroundColor: Colors.red,
              message: "Funções que dependem de internet não funcionarão",
              duration: Duration(seconds: 3),
            ),
          ),
          builder: (context, isOnline) => Scaffold(
            body: pages[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.orangeAccent,
              currentIndex: _currentIndex,
              items: _bottomBarList(),
              onTap: (index) {
                if (_currentIndex == index) {
                  return;
                }

                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }

  List<BottomNavigationBarItem> _bottomBarList() {
    return [
      BottomNavigationBarItem(
          title: Text(
            'Livros',
            style: TextStyle(color: _itemBottomColor(0)),
          ),
          icon: Icon(
            Icons.book,
            color: _itemBottomColor(0),
          )),
      BottomNavigationBarItem(
          title: Text(
            'Meus Livros',
            style: TextStyle(color: _itemBottomColor(1)),
          ),
          icon: Icon(
            Icons.favorite,
            color: _itemBottomColor(1),
          )),
      BottomNavigationBarItem(
          title: Text(
            'Opções',
            style: TextStyle(color: _itemBottomColor(2)),
          ),
          icon: Icon(
            Icons.settings,
            color: _itemBottomColor(2),
          )),
    ];
  }

  _itemBottomColor(index) {
    return _currentIndex == index ? Color.fromRGBO(128, 0, 32, 1) : Colors.white;
  }
}
