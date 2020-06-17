import 'dart:convert';

import 'package:livro_livre_app/model/Book.dart';
import 'package:sqflite/sqflite.dart';

class LivroDatabase {
  var _db;

/*
  ' pdf_link TEXT,'
        ' pdf_path TEXT,'
        ' current_position_audio TEXT,'
        'current_page INT
 */
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

  Future<Book> getById(id) async {
    await checagemGeral();
    List<Map> result =
        await _db.rawQuery('SELECT * FROM book where id = ?', [id]);
    if (result.length > 0) {
      return Book.fromJson(result[0]['data']);
    } else {
      return null;
    }
  }

  updateDataCollum(id, String data) async {
    int count = await _db
        .rawUpdate('UPDATE book SET data = ? WHERE id = ?', [data, id]);
  }

  updateCurrentAudioPath(id, currentAudioPath) async {
    await checagemGeral();
    Book book = await getById(id);
    var bookObj = jsonDecode(book.toJson());
    bookObj["audio_path"] = currentAudioPath;
    await updateDataCollum(id, jsonEncode(bookObj));
    return true;
  }

  updateCurrentPath(id, currentPath) async {
    await checagemGeral();
    Book book = await getById(id);
    var bookObj = jsonDecode(book.toJson());
    bookObj["pdf_path"] = currentPath;
    await updateDataCollum(id, jsonEncode(bookObj));
    return true;
  }

  updateCurrentPage(id, currentPage) async {
    await checagemGeral();
    Book book = await getById(id);
    var bookObj = jsonDecode(book.toJson());
    bookObj["current_page"] = currentPage;
    await updateDataCollum(id, jsonEncode(bookObj));
    return true;
  }

  updateCurrentPositionAudio(currentPositionAudio, id) async {
    await checagemGeral();
    Book book = await getById(id);
    var bookObj = jsonDecode(book.toJson());
    bookObj["current_position_audio"] = currentPositionAudio;
    await updateDataCollum(id, jsonEncode(bookObj));
    return true;
  }

  databaseInstance() async {
    _db = await openDatabase('projeto_livro_livre.db');
  }

  createDatabase() async {
    await databaseInstance();
    await _db.execute(
        'Create table if not exists book (id Text, data TEXT, pdf_link TEXT)');
  }

  checagemGeral() async {
    if (_db == null) {
      await databaseInstance();
      await createDatabase();
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
