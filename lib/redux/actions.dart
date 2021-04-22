import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';

class SetCurrentBottomBarIndex {
  final int payload;

  SetCurrentBottomBarIndex(this.payload);
}

class SetCurrentAppState {
  final String payload;

  SetCurrentAppState(this.payload);
}

class SetCurrentConsumingBookState {
  final Book payload;

  SetCurrentConsumingBookState(this.payload);
}

class SetMediaTypeState {
  final String payload;

  SetMediaTypeState(this.payload);
}

class SetIsPlayingState {
  final bool payload;

  SetIsPlayingState(this.payload);
}

class setDownloadsState {
  final List<YoutubeTaskDownload> payload;

  setDownloadsState(this.payload);
}

class setSelectedCategories {
  final List<String> payload;

  setSelectedCategories(this.payload);
}

class setCurrentBooksList {
  final List<Book> payload;

  setCurrentBooksList(this.payload);
}
