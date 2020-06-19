import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/PdfUtil.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';
import 'package:livro_livre_app/util/assetAudioPlayer.dart';

class LivroItem extends StatelessWidget {
  Book _book;
  Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int _pages = 0;
  bool _isReady = false;

  LivroItem(this._book);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        child: Row(
          children: <Widget>[
            Card(
              child: CachedNetworkImage(
                imageUrl: _book.volumeInfo.imageLinks != null
                    ? _book.volumeInfo.imageLinks.thumbnail
                    : 'https://text2image.com/user_images/202006/text2image_B9421546_20200613_190803.png',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    _book.shortExtractedTitle(textSize: 25),
                    style: const TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  _book.shortExtractedAuthor(textSize: 25),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () async {
                          store.dispatch(SetLivroSendoConsumidoState(_book));
                          store.dispatch(SetTipoMidiaState("PDF"));
                          store.dispatch(SetIsPlayingState(false));
                          assetsAudioPlayer.stop();
                          print("hey:" + _book.currentPage.toString());
                          _book = await LivroDatabase().getById(_book.id);
                          _controller = Completer<PDFViewController>();
                          if (_book.pdfPath == null || _book.pdfPath == "") {
                            await Flushbar(
                              icon: Icon(
                                Icons.cloud_download,
                                color: Colors.white,
                              ),
                              flushbarPosition: FlushbarPosition.TOP,
                              title: "Fazendo download do PDF",
                              backgroundColor: Colors.orangeAccent,
                              message:
                                  "Será aberto assim que finalizar o download",
                              duration: Duration(seconds: 3),
                            )
                              ..show(locator<NavigationService>()
                                  .navigatorKey
                                  .currentState
                                  .overlay
                                  .context);
                            PdfUtil()
                                .createFileOfPdfUrl(_book.pdfLink)
                                .then((f) async {
                              print("preparar, aponta e 2 >>>" +
                                  f.path.toString() +
                                  _book.currentPage.toString());
                              await LivroDatabase()
                                  .updateCurrentPath(_book.id, f.path);
                              _abrirPdf(_book, f.path, context);
                            });
                          } else {
                            print(
                                ">>>>>>>>>>>>" + _book.currentPage.toString());
                            _abrirPdf(_book, _book.pdfPath, context);
                          }
                        },
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.blue,
                        )),
                    if (_book.ytCode != null && _book.ytCode != "")
                      IconButton(
                        onPressed: () {
                          store.dispatch(SetLivroSendoConsumidoState(_book));
                          store.dispatch(SetTipoMidiaState("AUDIO"));
                          Navigator.pushNamed(
                              locator<NavigationService>()
                                  .navigatorKey
                                  .currentState
                                  .overlay
                                  .context,
                              '/player');
                        },
                        icon: Icon(Icons.headset),
                        color: Colors.blue,
                      ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )
                  ],
                ),
                Text(_book.ytCode),
              ],
            )
          ],
        ),
      ),
    );
  }

  _abrirPdf(Book book, filePath, context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFView(
          filePath: filePath,
          defaultPage: book.currentPage != null ? book.currentPage : 0,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: false,
          onRender: (_pages) {
            _pages = _pages;
            _isReady = true;
          },
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          },
          onPageChanged: (int page, int total) async {
            await LivroDatabase().updateCurrentPage(book.id, page);
          },
        ),
      ),
    );
  }
}
