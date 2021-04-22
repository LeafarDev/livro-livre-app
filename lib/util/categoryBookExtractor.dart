import 'package:html/dom.dart' as domPrex;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class categoryBookExtractor {
  var _lastTitle = "";
  var _regHref = new RegExp(
    r'^href\=\"(.+\.(pdf)\")',
    caseSensitive: false,
    multiLine: false,
  );
  var _arrayBook = [];

  extractBookByCategory({category = "Romance"}) async {
    _lastTitle = "";
    _arrayBook = [];
    final response = await http.Client()
        .get('http://www.projetolivrolivre.com/search/label/${category}');
    print("nada !");
    if (response.statusCode == 200) {
      var document = parse(response.body);
      document.body.children.forEach((domPrex.Element element) {
        element.innerHtml.toString().split(" ").forEach((part) {
          if (_regHref.hasMatch(part.trim().toString())) {
            var link = part.split('"')[1];
            _arrayBook.add([
              ..._extractTitleAuthor(document, link, category),
              ...[link.toString()]
            ]);
          }
        });
      });
      _extractYoutube(document);
      return _arrayBook;
    } else {
      print('falha no engano' + response.body);
      return [];
    }
  }

  _extractTitleAuthor(domPrex.Document document, link, category) {
    var textBeforeUrlWithName = parse(document.body.innerHtml.split(link)[0])
        .documentElement
        .text
        .trim();
    if (_lastTitle != "") {
      //print("IM HERE >" + _lastTitle);
      //split a partir do ultimo title e continua a lógica

      if (textBeforeUrlWithName.length > 1) {
        textBeforeUrlWithName =
            textBeforeUrlWithName.split(_lastTitle.trim())[
                textBeforeUrlWithName.split(_lastTitle.trim()).length - 1];
      }
    }

    var splitDashTitle = textBeforeUrlWithName.split("-");
    //print(textBeforeUrlWithName);
    if (splitDashTitle.length == 1) {
      splitDashTitle = textBeforeUrlWithName.split(":");
    }

    var author = "";
    var title = "";
    if (splitDashTitle.length == 1) {
      title = textBeforeUrlWithName;
    } else {
      var lengthSplitDashTitle = splitDashTitle.length;
      // author
      var untreatedAuthor = splitDashTitle[lengthSplitDashTitle - 2];
      var splitAuthorInline = untreatedAuthor.split("\n");

      author = splitAuthorInline[splitAuthorInline.length - 1];
      // title
      title = splitDashTitle[lengthSplitDashTitle - 1];
    }

    _lastTitle = title;

    title = title.toString().replaceAll(
        new RegExp(
            r'[^\â\ê\î\ô\û\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');

    author = author.toString().replaceAll(
        new RegExp(
            r'[^\â\ê\î\ô\û\w\à\è\ì\ò\ù\ã\ẽ\ĩ\õ\ũ\s\á\é\í\ó\ú\ç\ô\Á\É\Í\Ó\Ú\À\È\Ì\Ò\Ù\Ã\Ẽ\Ĩ\Õ\Ũ\n\ê]+'),
        '');
    print("retornando:" + _lastTitle + "|" + title);
    return [
      author.toString().trim().replaceAll('\n', ' '),
      title.toString().trim().replaceAll('\n', ' ')
    ];
  }

  _extractYoutube(document) {
    var index = 0;
    _arrayBook.forEach((value) {
      var htmlAfterUrl = document.body.innerHtml.split(value[2])[1];
      var chunksHref = htmlAfterUrl
          .split('href="https://www.youtube.com/watch?v=') as List;
      var watchYt = "";
      if (chunksHref.length > 1) {
        List<String> splitListYt = chunksHref[1].split('"') as List;
        if (chunksHref.length > 0 && splitListYt.length > 0) {
          watchYt = chunksHref[1].split('"')[0];
        } else {
          watchYt = null;
        }
      }
      var found = false;
      var nextIndex = index + 1;
      if (index == (_arrayBook.length - 1)) {
        nextIndex = index;
      }
      var htmlAfterUrl2 =
          document.body.innerHtml.split(_arrayBook[nextIndex][2])[1];
      var chunksHref2 = htmlAfterUrl2
          .split('href="https://www.youtube.com/watch?v=') as List;
      for (var i = 0; i < chunksHref2.length; i++) {
        if (watchYt == chunksHref2[i].split('"')[0]) {
          found = true;
          break;
        }
      }
      if (found == true) {
        watchYt = "";
      }
      print("found ?" + found.toString() + ">>" + watchYt);
      // remove time code (ex: &t=27s)
      var watchYtSplit = watchYt.split("&");
      if (watchYtSplit.length > 1) {
        watchYt = watchYtSplit[0];
      }
      print("${value[1]}  --- $watchYt");
      print("fly high$index");
      _arrayBook[index] = [
        ..._arrayBook[index],
        ...[watchYt]
      ];
      index++;
      print(
          '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
    });
    print("---------------fim-------------------");
  }
}
