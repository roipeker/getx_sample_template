import 'impl_web.dart' if (dart.library.io) 'impl_default.dart';

// ignore: avoid_classes_with_only_static_members
abstract class WebUtils {
  static void removePreloader() => WebUtilsImpl.removePreloader();
  static bool get isSimulator => WebUtilsImpl.isSimulator();
}
