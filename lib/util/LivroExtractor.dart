import 'dart:convert';

import 'package:html/dom.dart' as domPrex;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:livro_livre_app/api/LivroApi.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/util/ramdom.dart';

class LivroExtractor {
  var _ultimoTitulo = "";
  var _regHref = new RegExp(
    r'^href\=\"(.+\.(pdf)\")',
    caseSensitive: false,
    multiLine: false,
  );
  var _arrayLivro = [];
  var _listaLivro = [];
  var i = 0;

  _extrairLivrosPorCategoria({categoria = "romance"}) async {
    final response = await http.Client()
        .get('http://www.projetolivrolivre.com/search/label/Romance');
    print("nada !");
    if (response.statusCode == 200) {
      var document = parse(response.body);
      document.body.children.forEach((domPrex.Element element) {
        // processa titulo e link do pdf
        element.innerHtml.toString().split(" ").forEach((part) {
          if (_regHref.hasMatch(part.trim().toString())) {
            // pego apenas o link
            var link = part.split('"')[1];
            // show
            _arrayLivro.add([
              ..._extrairTituloAutor(document, link),
              ...[link.toString()]
            ]);
          }
        });
      });
      _extrairYoutube(document);
      return _arrayLivro;
    } else {
      print('falha no engano' + response.body);
      return [];
    }
  }

  _extrairTituloAutor(document, link) {
    var textoAntesDoLinkComNome = parse(document.body.innerHtml.split(link)[0])
        .documentElement
        .text
        .trim();

    if (_ultimoTitulo != "") {
      //split a partir do ultimo titulo e continua a lógica
      if (textoAntesDoLinkComNome.length > 1) {
        textoAntesDoLinkComNome =
            textoAntesDoLinkComNome.split(_ultimoTitulo)[1];
      }
    }

    var splitTracoTitulo = textoAntesDoLinkComNome.split("-");
    // tamanho split
    var tamanhosplitTracoTitulo = splitTracoTitulo.length;
    // autor
    var autorNaoTratado = splitTracoTitulo[tamanhosplitTracoTitulo - 2];
    var splitAutorInline = autorNaoTratado.split("\n");

    var autor = splitAutorInline[splitAutorInline.length - 1];
    // titulo
    var titulo = splitTracoTitulo[tamanhosplitTracoTitulo - 1];
    _ultimoTitulo = titulo;
    titulo = titulo.toString().replaceAll(
        new RegExp(
            r'[^\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');

    autor = autor.toString().replaceAll(
        new RegExp(
            r'[^\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');
    return [autor.toString().trim().replaceAll('\n', ' '), titulo.toString().trim().replaceAll('\n', ' ')];
  }

  _extrairYoutube(document) {
    var index = 0;
    _arrayLivro.forEach((value) {
      var htmlDepoisDoLink = document.body.innerHtml.split(value[2])[1];
      var pedacosHref = htmlDepoisDoLink
          .split('href="https://www.youtube.com/watch?v=') as List;
      var watchYt = "";
      if (pedacosHref.length > 1) {
        // pega exclusicamente a url
        List<String> listaSplityt = pedacosHref[1].split('"') as List;
        if (pedacosHref.length > 0 && listaSplityt.length > 0) {
          watchYt = pedacosHref[1].split('"')[0];
        } else {
          watchYt = null;
        }
      }
      // verifica se essa url capturada pertence ao livro atual ou
      // aos próximos da interação
      var achou = false;
      var indexAcima = index + 1;
      if (index == (_arrayLivro.length - 1)) {
        indexAcima = index;
      }
      var htmlDepoisDoLink2 =
          document.body.innerHtml.split(_arrayLivro[indexAcima][2])[1];
      var pedacosHref2 = htmlDepoisDoLink2
          .split('href="https://www.youtube.com/watch?v=') as List;
      for (var i = 0; i < pedacosHref2.length; i++) {
        if (watchYt == pedacosHref2[i].split('"')[0]) {
          achou = true;
          break;
        }
      }
      // caso tenha achado no próximos eu defino o watchYt como vazio
      if (achou == true) {
        watchYt = "";
      }
      print("achou ?" + achou.toString() + ">>" + watchYt);
      // se houver outra informação com o código, como tempo, remove. (ex: &t=27s)
      var watchYtSplit = watchYt.split("&");
      if (watchYtSplit.length > 1) {
        watchYt = watchYtSplit[0];
      }
      // salvar adiciona watchYtToSave
      print("${value[1]}  --- $watchYt");
      print("fly high$index");
      _arrayLivro[index] = [
        ..._arrayLivro[index],
        ...[watchYt]
      ];
      index++;
      print(
          '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
    });
    print("---------------fim-------------------");
  }

  processarExtracaoLivro() async {
    // PRECISO DEFINIR A PERIODICIDADE DA EXTRAÇÃO DO SITE
    if (_listaLivro.isEmpty) {
      _listaLivro = await _extrairLivrosPorCategoria();
    }
    /* if (_listaLivrosTexto != null) {
      _listaLivro = jsonDecode(_listaLivrosTexto);
      print(_listaLivro);
    } else {
      LivroApi().extrairLivrosPorCategoria();
    } */
    print("loadData");
    print("I cant Love u anymore - " + i.toString());
    if (_listaLivro.isNotEmpty) {
      for (var i = 0; i < _listaLivro.length; i++) {
        Book book;
        // verifico se já existe no banco, caso não, insiro
        var existe = await LivroDatabase().chechIfBookExists(_listaLivro[i][2]);
        print("existe ? =>" + existe.toString());
        if (existe == false) {
          // busca infos do livro no google api
          book = await LivroApi()
              .googleBooksApi(_listaLivro[i][1], _listaLivro[i][0]);
          // Só mostro se houver resultado
          if (book != null) {
            // adiciona link do pdf e referencia do audio se houver
            var bookObj = jsonDecode(book.toJson());
            bookObj["extracted_title"] = _listaLivro[i][1];
            bookObj["extracted_author"] = _listaLivro[i][0];
            bookObj["pdfLink"] = _listaLivro[i][2];
            bookObj["ytCode"] = _listaLivro[i][3];
            book = Book.fromJson(jsonEncode(bookObj));
            jsonEncode(
                {"pdfLink": _listaLivro[i][2], "ytCode": _listaLivro[i][3]});
          } else {
            // book padrao, caso não haja no google api
            book = Book.fromJson(jsonEncode({
              "id": RandomString(12),
              "pdfLink": _listaLivro[i][2],
              "ytCode": _listaLivro[i][3],
              "extracted_title": _listaLivro[i][1],
              "extracted_author": _listaLivro[i][0],
              "volumeInfo": {
                "title": _listaLivro[i][1],
                "authors": [_listaLivro[i][0]]
              }
            }));
          }
          var inserrt = await LivroDatabase().insert(book.toSqlFormat());
          print("chegou no insert" + inserrt.toString());
        }
      }
    } else {
      print("has no more ${_listaLivro.length}");
    }

    return true;
  }
}
