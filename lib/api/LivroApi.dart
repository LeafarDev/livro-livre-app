import 'package:html/dom.dart' as domPrex;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class LivroApi {
  var _ultimoTitulo = "";
  var _regHref = new RegExp(
    r'^href\=\"(.+\.(pdf)\")',
    caseSensitive: false,
    multiLine: false,
  );
  var _arrayLivro = [];
  var _regLink = new RegExp(
    r'^\=\"(.+\.(pdf)\")',
    caseSensitive: false,
    multiLine: false,
  );

  openLibraryBookInfo(titulo, autor) async {
    titulo = titulo.toString().replaceAll(new RegExp(r'[^\w\s]+'), '');
    autor = autor.toString().replaceAll(new RegExp(r'[^\w\s]+'), '');

    final response = await http.Client().get(
        "https://www.googleapis.com/books/v1/volumes?q=${titulo.toString().trim()} ${autor.toString().trim()}");
    print("https://www.googleapis.com/books/v1/volumes?q=${titulo.toString().trim()} ${autor.toString().trim()}o");
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('falha no engano -> openLibraryBookInfo: ' + response.body);
      return null;
    }
  }

  getAll({categoria = "romance"}) async {
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
    return [autor.toString(), titulo.toString()];
  }

  _extrairYoutube(document) {
    var index = 0;
    _arrayLivro.forEach((value) {
      var htmlDepoisDoLink = document.body.innerHtml.split(value[2])[1];
      var pedacosHref = htmlDepoisDoLink
          .split('href="https://www.youtube.com/watch?') as List;
      var watchYt = null;
      if (pedacosHref.length > 1) {
        List<String> listaSplityt = pedacosHref[1].split('"') as List;

        watchYt = pedacosHref.length > 0 && listaSplityt.length > 0
            ? pedacosHref[1].split('"')[0]
            : null;
      }

      // verifica se está presente a frente dos titulos a frente do atual
      var achou = false;
      var indexAcima = index + 1;
      if (index == (_arrayLivro.length - 1)) {
        indexAcima = index;
      }
      var htmlDepoisDoLink2 =
          document.body.innerHtml.split(_arrayLivro[indexAcima][2])[1];
      var pedacosHref2 = htmlDepoisDoLink2
          .split('href="https://www.youtube.com/watch?') as List;
      for (var i = 0; i < pedacosHref2.length; i++) {
        if (watchYt == pedacosHref2[i].split('"')[0]) {
          achou = true;
          break;
        }
      }
      // se não achou adiciono a lista
      if (achou == false) {
        print("${value[1]}  --- ${watchYt}");
        print("fly high${index}");
      }
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
}
