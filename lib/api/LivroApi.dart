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

  openLibraryBookInfo() {
    //"https://openlibrary.org/api/books?bibkeys=title:Quincas%20Borba&jscmd=data&format=json"
  }

  getAll() async {
    final response = await http.Client()
        .get('http://www.projetolivrolivre.com/search/label/Romance');
    print("nada !");
    print(_regLink.hasMatch(
        "http://ibamendes.org/Amor%20de%20Perdicao%20-%20Camilo%20Castelo%20Branco%20IBA%20MENDES.pdf"));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      document.body.children.forEach((domPrex.Element element) {
        // processa titulo e link do pdf
        element.innerHtml.toString().split(" ").forEach((part) {
          if (_regHref.hasMatch(part.trim().toString())) {
            // pego apenas o link
            var link = part.split('"')[1];
            // show
            _arrayLivro.add([..._extrairTituloAutor(document, link), link]);
          }
        });
        //print(_arrayLivro);
        _extrairYoutube(document);
      });
    } else {
      print('falha no engano' + response.body);
    }
    return;
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
    return [autor, titulo];
  }

  _extrairYoutube(document) {
    var index = 0;
    _arrayLivro.forEach((value) {
      var htmlDepoisDoLink = document.body.innerHtml.split(value[2])[1];
      var pedacosHref = htmlDepoisDoLink
          .split('href="https://www.youtube.com/watch?') as List;
      var watchYt = pedacosHref[1].split('"')[0];
      print(watchYt);
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
      index++;
      print(
          '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
    });
    print("---------------fim-------------------");
  }
}
