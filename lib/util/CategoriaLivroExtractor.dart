import 'package:html/dom.dart' as domPrex;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class CategoriaLivroExtractor {
  var _ultimoTitulo = "";
  var _regHref = new RegExp(
    r'^href\=\"(.+\.(pdf)\")',
    caseSensitive: false,
    multiLine: false,
  );
  var _arrayLivro = [];

  extrairLivrosPorCategoria({categoria = "Romance"}) async {
    _ultimoTitulo = "";
    _arrayLivro = [];
    final response = await http.Client()
        .get('http://www.projetolivrolivre.com/search/label/${categoria}');
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
              ..._extrairTituloAutor(document, link, categoria),
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

  _extrairTituloAutor(domPrex.Document document, link, categoria) {
    var textoAntesDoLinkComNome = parse(document.body.innerHtml.split(link)[0])
        .documentElement
        .text
        .trim();
    if (_ultimoTitulo != "") {
      //print("IM HERE >" + _ultimoTitulo);
      //split a partir do ultimo titulo e continua a lógica

      if (textoAntesDoLinkComNome.length > 1) {
        textoAntesDoLinkComNome =
            textoAntesDoLinkComNome.split(_ultimoTitulo.trim())[
                textoAntesDoLinkComNome.split(_ultimoTitulo.trim()).length - 1];
      }
    }

    var splitTracoTitulo = textoAntesDoLinkComNome.split("-");
    //print(textoAntesDoLinkComNome);
    if (splitTracoTitulo.length == 1) {
      splitTracoTitulo = textoAntesDoLinkComNome.split(":");
    }

    var autor = "";
    var titulo = "";
    if (splitTracoTitulo.length == 1) {
      titulo = textoAntesDoLinkComNome;
    } else {
      // tamanho split
      var tamanhosplitTracoTitulo = splitTracoTitulo.length;
      // autor
      var autorNaoTratado = splitTracoTitulo[tamanhosplitTracoTitulo - 2];
      var splitAutorInline = autorNaoTratado.split("\n");

      autor = splitAutorInline[splitAutorInline.length - 1];
      // titulo
      titulo = splitTracoTitulo[tamanhosplitTracoTitulo - 1];
    }

    _ultimoTitulo = titulo;

    titulo = titulo.toString().replaceAll(
        new RegExp(
            r'[^\â\ê\î\ô\û\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');

    autor = autor.toString().replaceAll(
        new RegExp(
            r'[^\â\ê\î\ô\û\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');
    print("retornando:" + _ultimoTitulo + "|" + titulo);
    return [
      autor.toString().trim().replaceAll('\n', ' '),
      titulo.toString().trim().replaceAll('\n', ' ')
    ];
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
}
