import 'package:http/http.dart' as http;

class AudioApi {
  Future<String> getUrlMp3Api(YTCode) async {
    final res = await http
        .get("https://www.320youtube.com/v1/watch?v=${YTCode}", headers: {});

    if (res.statusCode == 200) {
      print(res.body);
      String jsonString = res.body.split('\(')[1];
      String url = res.body
          .split('class="btn btn-success btn-lg" href="')[1]
          .split('"')[0];
      print(url);
      return url;
    } else {
      print(res.body);
      return null;
    }
  }
}
