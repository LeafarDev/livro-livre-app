import 'dart:convert';

import 'package:livro_livre_app/api/BookApi.dart';
import 'package:livro_livre_app/database/BookDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/categoryBookExtractor.dart';
import 'package:livro_livre_app/util/ramdom.dart';

class BookExtractor {
  var _bookList = [];

  processarExtracaoLivro() async {
    // PRECISO DEFINIR A PERIODICIDADE DA EXTRAÇÃO DO SITE
    if (_bookList.isEmpty) {
      var categories = store.state.categories;
      print("loadData");
      for (var i = 0; i < categories.length; i++) {
        processarExtracaoLivrocategory(categories[i]);
      }
    }
    return true;
  }

  Future processarExtracaoLivrocategory(String category) async {
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${category}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    var bookList = await categoryBookExtractor()
        .extractBookByCategory(category: category);
    if (bookList.isNotEmpty) {
      for (var j = 0; j < bookList.length; j++) {
        preparacaoEInsertDados(bookList[j], category);
      }
    } else {
      print("has no more ${bookList.length}");
    }
  }

  Future preparacaoEInsertDados(livroExtraido, String category) async {
    var exists = await BookDatabase().chechIfBookExists(livroExtraido[2]);
    print("exists ? =>" + exists.toString());
    if (exists == false) {
      var book =
      await BookApi().googleBooksApi(livroExtraido[1], livroExtraido[0]);
      if (book != null) {
        // adiciona link do pdf e referencia do audio se houver
        var bookObj = jsonDecode(book.toJson());
        bookObj["extracted_title"] = livroExtraido[1];
        bookObj["category"] = category;
        bookObj["extracted_author"] = livroExtraido[0];
        bookObj["pdfLink"] = livroExtraido[2];
        bookObj["ytCode"] = livroExtraido[3];
        book = Book.fromJson(jsonEncode(bookObj));
        jsonEncode({"pdfLink": livroExtraido[2], "ytCode": livroExtraido[3]});
      } else {
        // book padrao, caso não haja no google api
        book = Book.fromJson(jsonEncode({
          "id": RandomString(12),
          "category": category,
          "pdfLink": livroExtraido[2],
          "ytCode": livroExtraido[3],
          "extracted_title": livroExtraido[1],
          "extracted_author": livroExtraido[0],
          "volumeInfo": {
            "title": livroExtraido[1],
            "authors": [livroExtraido[0]]
          }
        }));
      }
      var inserrt = await BookDatabase().insert(book.toSqlFormat());
      print("chegou no insert" + inserrt.toString());
    }
  }
}
