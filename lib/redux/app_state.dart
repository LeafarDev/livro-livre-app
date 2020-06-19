import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';

class AppState {
  String currentAppState = 'resumed';
  int currentBottomBarIndex = 0;
  Book livroSendoConsumido = null;
  String tipoMidia = "PDF"; //PDF ou AUDIO
  bool isPlaying = false; // em caso de audio
  AppState();
  List<YoutubeTaskDownload> downloadsYt = [];

  AppState.fromAppState(AppState another) {
    downloadsYt = another.downloadsYt;
    currentBottomBarIndex = another.currentBottomBarIndex;
    currentAppState = another.currentAppState;
    livroSendoConsumido = another.livroSendoConsumido;
    tipoMidia = another.tipoMidia;
    isPlaying = another.isPlaying;
  }
}
