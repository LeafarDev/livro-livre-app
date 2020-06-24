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
  List<String> categorias3 = ["Ensaios"];
  List<String> selectedCategorias = null;
  List<String> categorias = [
    "Biografia",
    "Carta",
    "Ciência",
    "Conto",
    "Crítica",
    "Crônica",
    "Educação",
    "Ensaio",
    "Filosofia",
    "História",
    "Humor",
    "Infantil",
    "Linguagem",
    "Memória",
    "Miscelânea",
    "Novela",
    "Poesia",
    "Política",
    "Romance",
    "Sociologia",
    "Teatro",
    "Teologia"
  ];
  List<Book> listaAtualLivros = [];

  AppState.fromAppState(AppState another) {
    listaAtualLivros = another.listaAtualLivros;
    selectedCategorias = another.selectedCategorias;
    categorias = another.categorias;
    downloadsYt = another.downloadsYt;
    currentBottomBarIndex = another.currentBottomBarIndex;
    currentAppState = another.currentAppState;
    livroSendoConsumido = another.livroSendoConsumido;
    tipoMidia = another.tipoMidia;
    isPlaying = another.isPlaying;
  }
}
