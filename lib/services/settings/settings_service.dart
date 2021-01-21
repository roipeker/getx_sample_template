import 'package:flutter/services.dart';
import 'package:getx_app_template/widgets/dialogs/notification_dialog.dart';

import '../services.dart';

/// middle man service to deal with other service, like a central point
class SettingsService extends GetxService implements BaseService {
  static SettingsService get() => Get.find();
  final _log = AppLog('SettingsService');

  final useMemCache = false.obs;
  final useDiskCache = false.obs;
  final useImageCache = false.obs;
  final useDailyNotifications = true.obs;

  // final api = ApiService.get();
  final storage = StorageService.get();
  final firebase = FirebaseService.get();

  @override
  Future<void> init() async {
    /// read properties.
    useMemCache.value = storage.settingsMemCache ?? true;
    useDiskCache.value = storage.settingsDiskCache ?? false;
    useImageCache.value = storage.settingsImageCache ?? true;
    // useDailyNotifications.value = firebase.dailySubscription;
    // api.memCacheInterceptor.enabled = useMemCache();
    // api.getCacheInterceptor.enabled = useDiskCache();
    // ImageWidget.enabledCache = useImageCache();

    /// using Workers, keep always the state in storage.
    ever<bool>(useMemCache, (value) {
      // storage.settingsMemCache = api.memCacheInterceptor.enabled = value;
    });
    ever<bool>(useDiskCache, (value) {
      // storage.settingsDiskCache = api.getCacheInterceptor.enabled = value;
    });
    ever<bool>(useImageCache, (value) {
      // storage.settingsImageCache = ImageWidget.enabledCache = value;
    });
    ever<bool>(useDailyNotifications, (value) {
      // firebase.dailySubscription = value;
    });
  }

  void clearCache() {
    // ImageWidget.clearMem();
    // ImageWidget.clearDisk();
    // api.memCacheInterceptor.clear();
    // api.getCacheInterceptor.clear();
  }

  void throwExceptionTest() => throw Exception("Testing an exception!");

  void crashAppTest() => FirebaseService.get().testCrash();

  void initFCM() => FirebaseService.get().initFCM();

  void showLoadNotifications() => Get.dialog(TestNotificationDialog());

  void testFCM() {
    _log("testFCM");
    // return api.user.testNotification(title: 'Hello', message: 'GetX');
  }

  void copyToken() {
    // final token = FirebaseService.get().fcmToken;
    final token = FirebaseService.get().fcmToken;
    Clipboard.setData(ClipboardData(text: token));
    AppGetUtils.showSuccess(
      'Push notification token copied to clipboard',
      title: 'Token copied!',
    );
  }
}
