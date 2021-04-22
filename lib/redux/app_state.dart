import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';

class AppState {
  String currentAppState = 'resumed';
  int currentBottomBarIndex = 0;
  Book currentConsumingBook = null;
  String mediaType = "PDF"; //PDF ou AUDIO
  bool isPlaying = false; // em caso de audio
  AppState();

  List<YoutubeTaskDownload> downloadsYt = [];
  List<String> categories3 = ["Ensaios"];
  List<String> selectedCategories = null;
  List<String> categories = [
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
  List<Book> currentBookList = [];

  AppState.fromAppState(AppState another) {
    currentBookList = another.currentBookList;
    selectedCategories = another.selectedCategories;
    categories = another.categories;
    downloadsYt = another.downloadsYt;
    currentBottomBarIndex = another.currentBottomBarIndex;
    currentAppState = another.currentAppState;
    currentConsumingBook = another.currentConsumingBook;
    mediaType = another.mediaType;
    isPlaying = another.isPlaying;
  }
}
