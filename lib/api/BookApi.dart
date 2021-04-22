import 'package:http/http.dart' as http;
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/GoogleBookSearchResult.dart';

class BookApi {
  Future<Book> googleBooksApi(title, author) async {
    title = title.toString().replaceAll(
        new RegExp(
            r'[^\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\ê]+'),
        '');
    author = author.toString().replaceAll(
        new RegExp(
            r'[^\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\ê]+'),
        '');

    final response = await http.Client().get(
        "https://www.googleapis.com/books/v1/volumes?q=${title.toString().trim()} ${author.toString().trim()}");
    print(
        "https://www.googleapis.com/books/v1/volumes?q=${title.toString().trim()} ${author.toString().trim()}");
    if (response.statusCode == 200) {
      var result = GoogleBookSearchResult.fromJson(response.body);
      if (result.items == null) {
        return null;
      }
      if (result.items.length > 0) {
        return result.items[0];
      }
      return null;
    } else {
      print('falha no engano -> googleBooksApi: ' + response.body);
      return null;
    }
  }
}
