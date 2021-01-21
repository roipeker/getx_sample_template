import 'package:get/get.dart';
import 'package:getx_app_template/pages/home/home_repo.dart';

import 'firebase/firebase_service.dart';
import 'session/session_service.dart';
import 'settings/settings_service.dart';
import 'storage/storage_service.dart';

export 'package:get/get.dart';
export 'package:getx_app_template/utils/utils.dart';

export 'firebase/firebase_service.dart';
export 'session/session_service.dart';
export 'settings/settings_service.dart';
export 'storage/storage_service.dart';

abstract class AppServices {
  static Future<void> init() async {
    /// order matters.
    await Get.put(StorageService()).init();
    await Get.put(FirebaseService()).init();
    // await Get.put(ApiCacheService()).init();
    // await Get.put(ApiService()).init();
    await Get.put(SessionService()).init();
    await Get.put(SettingsService()).init();

    /// request for notifications permissions.
    await FirebaseService.get().initFCM();

    _initRepositories();
  }

  static void _initRepositories() {
    /// if we need repositories, register here.
    Get.lazyPut(() => HomeRepo());
  }
}

abstract class BaseService {
  Future<void> init() async {}
}
