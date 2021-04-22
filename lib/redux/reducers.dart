import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/app_state.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is SetCurrentBottomBarIndex) {
    newState.currentBottomBarIndex = action.payload;
  }
  if (action is SetCurrentAppState) {
    newState.currentAppState = action.payload;
  }
  if (action is SetCurrentConsumingBookState) {
    newState.currentConsumingBook = action.payload;
  }

  if (action is SetMediaTypeState) {
    newState.mediaType = action.payload;
  }

  if (action is SetIsPlayingState) {
    newState.isPlaying = action.payload;
  }

  if (action is setDownloadsState) {
    newState.downloadsYt = action.payload;
  }

  if (action is setSelectedCategories) {
    newState.selectedCategories = action.payload;
  }

  if(action is setCurrentBooksList) {
    newState.currentBookList = action.payload;
  }

  return newState;
}
