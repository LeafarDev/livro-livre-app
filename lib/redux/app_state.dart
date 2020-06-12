

class AppState {
  String currentAppState = 'resumed';
  int currentBottomBarIndex = 0;

  AppState();

  AppState.fromAppState(AppState another) {
    currentBottomBarIndex = another.currentBottomBarIndex;
    currentAppState = another.currentAppState;
  }
}
