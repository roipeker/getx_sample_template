import 'dart:io';

abstract class WebUtilsImpl {
  static void removePreloader() {}

  static bool isSimulator() {
    return !Platform.resolvedExecutable.startsWith('/private/var/');
  }
}
