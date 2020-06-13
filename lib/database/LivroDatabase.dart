import 'package:livro_livre_app/model/Book.dart';
import 'package:sqflite/sqflite.dart';

class LivroDatabase {
  var _db;

  Future<List<Book>> all() async {
    await checagemGeral();
    List<Map> result = await _db.rawQuery('SELECT * FROM book');
    if (result.length > 0) {
      List<Book> books = [];
      for (var i = 0; i < result.length; i++) {
        books.add(Book.fromJson(result[i]['data']));
      }
      return books;
    } else {
      return [];
    }
  }

  updateCurrentPath(id, currentPath) {}

  updateCurrentPage(id, currentPage) {}

  updateCurrentPositionAudio(currentPositionAudio) {}

  databaseInstance() async {
    _db = await openDatabase('projeto_livro_livre.db');
  }

  createDatabase() async {
    await _db.execute('Create table if not exists book (id Text,'
        ' data TEXT,'
        ' pdf_link TEXT,'
        ' pdf_path TEXT,'
        ' current_position_audio TEXT,'
        'current_page INT)');
  }

  checagemGeral() async {
    if (_db == null) {
      await databaseInstance();
    }
  }

  chechIfBookExists(pdfLink) async {
    await checagemGeral();
    var count = Sqflite.firstIntValue(await _db
        .rawQuery('SELECT COUNT(*) FROM book where pdf_link = ?', [pdfLink]));
    return count > 0;
  }

  insert(Map<String, dynamic> data) async {
    await checagemGeral();
    return await _db.insert("book", data);
  }

  Future<Book> getByPdfLink(pdfLink) async {
    await checagemGeral();
    List<Map> result =
        await _db.rawQuery('SELECT * FROM book where pdf_link = ?', [pdfLink]);
    if (result.length > 0) {
      return Book.fromJson(result[0]['data']);
    } else {
      return null;
    }
  }
}
