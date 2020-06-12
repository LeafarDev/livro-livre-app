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
  return newState;
}
