// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

abstract class WebUtilsImpl {
  static void removePreloader() {
    final loader = document.getElementsByClassName('spinner');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }
  }

  static bool isSimulator() => false;
}
