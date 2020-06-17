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

class SetLivroSendoConsumidoState {
  final Book payload;

  SetLivroSendoConsumidoState(this.payload);
}

class SetTipoMidiaState {
  final String payload;

  SetTipoMidiaState(this.payload);
}

class SetIsPlayingState {
  final bool payload;

  SetIsPlayingState(this.payload);
}

class SetCurrentDurationState {
  final Duration payload;

  SetCurrentDurationState(this.payload);
}

class setDownloadsState {
  final List<YoutubeTaskDownload> payload;

  setDownloadsState(this.payload);
}

