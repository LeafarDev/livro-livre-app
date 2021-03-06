import 'dart:io';

import 'package:livro_livre_app/database/BookDatabase.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class AudioUtil {
  final yt = YoutubeExplode();

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  callDownloadOrPath(Book book) async {
    StreamManifest manifest =
        await yt.videos.streamsClient.getManifest(book.ytCode);

    var streams = manifest.audioOnly;

    if (streams != null) {
      var dir = await getExternalStorageDirectory();
      var audio = streams.last;
      var audioStream = yt.videos.streamsClient.get(audio);
      print("${dir.path}/${book.ytCode}.webm");
      var filePath = "${dir.path}/${book.ytCode}.webm";
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
        ..progress = 0
        ..lastUpdate = DateTime.now()));
      store.dispatch(setDownloadsState(downloadsYt));
      await for (var data in audioStream) {
        count += data.length;
        var progress = ((count / len) * 100).round();
        if (progress != oldProgress) {
          print('$progress%');
          oldProgress = progress;
          // update progress
          downloadsYt = store.state.downloadsYt;
          for (var i = 0; i < downloadsYt.length; i++) {
            if (downloadsYt[i].id == book.ytCode) {
              downloadsYt[i] = YoutubeTaskDownload((b) => b
                ..id = book.ytCode
                ..progress = progress
                ..lastUpdate = DateTime.now());
              store.dispatch(setDownloadsState(downloadsYt));
              break;
            }
          }
        }
        output.add(data);
      }
      print("||||||||||||||||||||||||||||||||||||||||||\n");
      await output.close();
      await BookDatabase().updateCurrentAudioPath(book.id, filePath);
      var updatedBook = await BookDatabase().getById(book.id);
      store.dispatch(SetCurrentConsumingBookState(updatedBook));
      return filePath;
    }
  }
}
