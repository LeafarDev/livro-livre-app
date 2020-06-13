import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:path_provider/path_provider.dart';

class Repository extends LoadingMoreBase<Container> {
  var _context;

  Repository(context) {
    _context = context;
  }

  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  var _listaLivro = [];
  Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  bool get hasMore => _hasMore || forceRefresh;

  generateCard(Book book) {
    return Container(
      child: Card(
        elevation: 6,
        child: Row(
          children: <Widget>[
            Card(
              child: CachedNetworkImage(
                imageUrl: book.volumeInfo.imageLinks != null
                    ? book.volumeInfo.imageLinks.thumbnail
                    : 'https://text2image.com/user_images/202006/text2image_B9421546_20200613_190803.png',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    book.shortExtractedTitle(textSize: 25),
                    style: const TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  book.shortExtractedAuthor(textSize: 25),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      // PRECISO ATUALIZAR PDFPATH E PAGINA ATUAL
                        onPressed: () async {
                          print("hey");
                          _controller = Completer<PDFViewController>();
                          var filePath = book.pdfPath;
                          if (book.pdfPath != null && book.pdfPath != "") {
                            createFileOfPdfUrl(book.pdfLink).then((f) {
                              print(f.path);
                              print("opening:");
                              filePath = f.path;
                            });
                          }

                          Navigator.push(
                            _context,
                            MaterialPageRoute(
                              builder: (context) => PDFView(
                                filePath: filePath,
                                defaultPage: currentPage,
                                enableSwipe: true,
                                swipeHorizontal: false,
                                autoSpacing: false,
                                pageFling: false,
                                onRender: (_pages) {
                                  pages = _pages;
                                  isReady = true;
                                },
                                onError: (error) {
                                  print(error.toString());
                                },
                                onPageError: (page, error) {
                                  print('$page: ${error.toString()}');
                                },
                                onViewCreated:
                                    (PDFViewController pdfViewController) {
                                  _controller.complete(pdfViewController);
                                },
                                onPageChanged: (int page, int total) {
                                  currentPage = page;
                                },
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.blue,
                        )),
                    if (book.audioLink != null && book.audioLink != "")
                      Icon(
                        Icons.headset,
                        color: Colors.blue,
                      ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )
                  ],
                ),
                Text(book.id),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    // PRECISO SALVAR CATEGORIA DO LIVRO NO BANCO
    // CARREGAR DO DATABASE PRA N FICAR PINGANDO NO SITE
    // ARRUMAR DESIGN DA LISTA DE LIVRO
    List<Book> books = await LivroDatabase().all();
    if (books.isNotEmpty && books.length > length) {
      add(generateCard(books[length]));
    } else {
      print("has no more ${_listaLivro.length}");
      _hasMore = false;
    }
    pageindex++;
    return true;
  }

  Future<File> createFileOfPdfUrl(url) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
