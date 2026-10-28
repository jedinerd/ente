import 'package:flutter/widgets.dart';

// Whether the app is on screen. Code widgets stop their refresh timers while
// this is false. Two inputs are combined: the window state reported by
// WindowListenerService on desktop (hidden to tray, minimized), and the app
// lifecycle for mobile backgrounding. The lifecycle alone is not enough on
// Windows, where hiding the window leaves the state at `inactive`.
class AppVisibility {
  AppVisibility._();

  static final ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);
  static bool _lifecycleVisible = true;
  static bool _windowShown = true;

  static void onLifecycleChanged(AppLifecycleState? state) {
    _lifecycleVisible =
        state == null ||
        state == AppLifecycleState.resumed ||
        state == AppLifecycleState.inactive;
    _update();
  }

  static void onWindowShown(bool shown) {
    _windowShown = shown;
    _update();
  }

  static void _update() {
    isVisible.value = _lifecycleVisible && _windowShown;
  }
}
