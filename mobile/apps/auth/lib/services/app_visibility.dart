import 'package:flutter/widgets.dart';

// Whether the app is on screen. Code widgets stop their refresh timers while
// this is false (window hidden to tray, minimized, or app backgrounded).
class AppVisibility {
  AppVisibility._();

  static final ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);

  static void onLifecycleChanged(AppLifecycleState? state) {
    isVisible.value =
        state == null ||
        state == AppLifecycleState.resumed ||
        state == AppLifecycleState.inactive;
  }
}
