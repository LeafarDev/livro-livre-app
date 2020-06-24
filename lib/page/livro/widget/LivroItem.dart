import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/PdfUtil.dart';
import 'package:livro_livre_app/util/PdfViewerPage.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';
import 'package:livro_livre_app/util/assetAudioPlayer.dart';

class LivroItem extends StatefulWidget {
  Book _book;

  LivroItem(this._book);

  @override
  LivroItemState createState() {
    return LivroItemState(_book);
  }
}

class LivroItemState extends State<LivroItem> {
  Book _book;

  LivroItemState(this._book);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
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
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    _book.shortExtractedTitle(textSize: 25),
                    style: const TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  _book.shortExtractedAuthor(textSize: 25),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black45,
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
                          var objTemp = await LivroDatabase().getById(_book.id);
                          setState(() {
                            _book = objTemp;
                          });

                          if (_book.pdfPath == null || _book.pdfPath == "") {
                            await Flushbar(
                              icon: Icon(
                                Icons.cloud_download,
                                color: Colors.white,
                              ),
                              flushbarPosition: FlushbarPosition.TOP,
                              title: "Fazendo download do PDF",
                              backgroundColor: Colors.cyanAccent,
                              message:
                                  "Será aberto assim que finalizar o download",
                              duration: Duration(seconds: 8),
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
                              var objTemp = await LivroDatabase().getById(_book.id);
                              setState(() {
                                _book = objTemp;
                              });
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
                    IconButton(
                      onPressed: () async {
                        var title = "Adicionado à sua lista";
                        var messageFlush = "Verifique em \"Meus Livros\" ";
                        var isNowFavorite =
                            _book.favorite == false || _book.favorite == null;
                        if (isNowFavorite == false) {
                          title = "Removido de sua lista";
                          messageFlush =
                              "Não estará mais disponivel em \"Meus Livros\" ";
                        }
                        await Flushbar(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          flushbarPosition: FlushbarPosition.TOP,
                          title: title,
                          backgroundColor: Colors.cyanAccent,
                          message: messageFlush,
                          duration: Duration(seconds: 3),
                        )
                          ..show(locator<NavigationService>()
                              .navigatorKey
                              .currentState
                              .overlay
                              .context);
                        await LivroDatabase()
                            .updateFavorite(_book.id, isNowFavorite);
                        var objTemp = await LivroDatabase().getById(_book.id);
                        setState(() {
                          _book = objTemp;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _book.favorite == true
                            ? Colors.orangeAccent
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _abrirPdf(Book book, filePath, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(_book),
      ),
    );
  }
}
