import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:livro_livre_app/api/AudioApi.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class AudioUtil {
  final yt = YoutubeExplode();

  callDownloadOrPath(Book book) async {
    StreamManifest manifest =
        await yt.videos.streamsClient.getManifest(book.ytCode);

    var streams = manifest.audioOnly;

    if (streams != null) {
      var dir = await getExternalStorageDirectory();
      var audio = streams.first;
      var audioStream = yt.videos.streamsClient.get(audio);
      print("${dir.path}/${book.ytCode}.mp3");
      var filePath = "${dir.path}/${book.ytCode}.mp3";
      var file = File(filePath);

      // Open the file in appendMode.
      var output = file.openWrite(mode: FileMode.writeOnlyAppend);

      // Track the file download status.
      var len = audio.size.totalBytes;
      var count = 0;
      var oldProgress = -1;

      // Create the message and set the cursor position.
      var msg = 'Downloading ${filePath}  \n';
      print(msg);

      var downloadsYt = store.state.downloadsYt;
      // setDownloadsState
      downloadsYt.add(YoutubeTaskDownload((b) => b
        ..id = book.ytCode
        ..progresso = 0
        ..ultimaAtualizacao = DateTime.now()));
      store.dispatch(setDownloadsState(downloadsYt));
      await for (var data in audioStream) {
        count += data.length;
        var progress = ((count / len) * 100).round();
        if (progress != oldProgress) {
          print('$progress%');
          oldProgress = progress;
          // update progresso
          downloadsYt = store.state.downloadsYt;
          for (var i = 0; i < downloadsYt.length; i++) {
            if (downloadsYt[i].id == book.ytCode) {
              downloadsYt[i] = YoutubeTaskDownload((b) => b
                ..id = book.ytCode
                ..progresso = progress
                ..ultimaAtualizacao = DateTime.now());
              store.dispatch(setDownloadsState(downloadsYt));
              break;
            }
          }
        }
        output.add(data);
      }
      print("||||||||||||||||||||||||||||||||||||||||||\n");
      await output.close();
      await LivroDatabase().updateCurrentAudioPath(book.id, filePath);
      var bookAtualizado = await LivroDatabase().getById(book.id);
      store.dispatch(SetLivroSendoConsumidoState(bookAtualizado));
      return filePath;
    }
  }

  Future<String> callDownloadOrPath2(Book book) async {
    var urlMp3 = await AudioApi().getUrlMp3Api(book.ytCode);
    createMp3FileFromYtUrl(urlMp3).then((f) async {
      print(f.path);
      print(await f.exists());
      await LivroDatabase().updateCurrentAudioPath(book.id, f.path);
      var bookAtualizado = await LivroDatabase().getById(book.id);
      store.dispatch(SetLivroSendoConsumidoState(bookAtualizado));
      return f.path;
    });
  }

  Future<File> createMp3FileFromYtUrl(url) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getExternalStorageDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename.mp3");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
