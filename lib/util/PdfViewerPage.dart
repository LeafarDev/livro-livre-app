import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';

class PdfViewerPage extends StatefulWidget {
  Book _book;

  PdfViewerPage(this._book);

  _PdfViewerPageState createState() => new _PdfViewerPageState(_book);
}

class _PdfViewerPageState extends State<PdfViewerPage>
    with WidgetsBindingObserver {
  Book _book;
  Completer<PDFViewController> _controller = Completer<PDFViewController>();
  UniqueKey pdfViewerKey = UniqueKey();

  _PdfViewerPageState(this._book);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (Platform.isAndroid) {
      Future.delayed(Duration(milliseconds: 250), () {
        setState(() => pdfViewerKey = UniqueKey());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PDFView(
          key: pdfViewerKey,
          pageSnap: true,
          filePath: _book.pdfPath,
          defaultPage: _book.currentPage != null ? _book.currentPage : 0,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            pdfViewController.setPage(_book.currentPage != null ? _book.currentPage : 0);
          },
          onPageChanged: (int page, int total) async {
            await LivroDatabase().updateCurrentPage(_book.id, page);
          },
        ));
  }
}
