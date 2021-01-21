import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../services.dart';
import 'analytics.dart';

class FirebaseService extends GetxService implements BaseService {
  static FirebaseService get() => Get.find();
  final _log = AppLog('FirebaseService');

  static final analytics = AppAnalytics();

  bool _fcmEnabled;
  bool _crashlyticsEnabled;
  String _fcmToken;
  bool get crashlyticsEnabled => _crashlyticsEnabled;
  bool get fcmEnabled => _fcmEnabled;
  bool get analyticsEnabled => analytics.enabled;
  String get fcmToken => _fcmToken;

  @override
  Future<void> init() async {
    _initCapabilities();
    // final _app = await Firebase.initializeApp();
    // _app.setAutomaticDataCollectionEnabled(true);
    // _app.setAutomaticResourceManagementEnabled(true);
    _initCrashlytics();
  }

  void _initCapabilities() {
    analytics.init();
    if (GetPlatform.isAndroid) {
      _crashlyticsEnabled = true;
      _fcmEnabled = true;
    } else {
      _crashlyticsEnabled =
          !GetPlatform.isWeb && !WebUtils.isSimulator && !kDebugMode;
      _fcmEnabled =
          !GetPlatform.isWeb && !GetPlatform.isDesktop && !WebUtils.isSimulator;
    }
    _log('Firebase analytics enabled: $analyticsEnabled');
    _log('Firebase crashlytics enabled: $_crashlyticsEnabled');
    _log('Firebase FCM enabled: $_fcmEnabled');
  }

  Future<void> _initCrashlytics() async {
    if (!crashlyticsEnabled) return;
    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError;
    FlutterError.onError = (errorDetails) async {
      // await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
//       crashlytics.sendUnsentReports();
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
    }
  }

  void testCrash() {
    if (!crashlyticsEnabled) return;
    _log('testCrash()');
    // FirebaseCrashlytics.instance.crash();
  }

  void updateUser() {
    _log('updateUser()');
    // sendMyToken();
    // final user = SessionService?.user;
    // final uid = user?.id;
    // if (uid == null) return;
    // if (crashlyticsEnabled) {
    //   crashlytics.setUserIdentifier(uid);
    // }
    // analytics.updateUser(user);
  }

  void logError(String msg) {
    if (!crashlyticsEnabled) return;
    _log('logError() $msg');
    // crashlytics.log(msg);
  }

  void recordError(Error error, StackTrace stack) {
    _log('EXCEPTION: $error');
    _log('STACK: $stack');
    // crashlytics.recordError(error, stack);
  }

  /// --- notifications ---
  Future<void> initFCM() async {
    if (!fcmEnabled) return;
    // final approved = await _fcm.requestNotificationPermissions() ?? true;
    // if (!approved) return;
    _log('initFCM())');
    // await sendMyToken();
    // _fcm.configure(
    //   onLaunch: _fcmHandleLaunch,
    //   onResume: _fcmHandleResume,
    //   onMessage: _fcmHandleMessage,
    // );
  }

  Future<void> sendMyToken() async {
    if (!fcmEnabled) return;
    _log("Trying to get FCM token now");
    _fcmToken = '123abc';
    // _fcmToken = await _fcm.getToken();
    _log("FCM Token is:: $fcmToken");
    // if (fcmToken != null && api.auth.hasToken) {
    //   final serverResponse = await api.user.setNotificationToken(
    //     token: fcmToken,
    //   );
    //   print("Server response:: $serverResponse");
    // }
  }

  void removeNotifications() {
    _log("removeNotifications()");
  }

  /// notification texts to add during on fcm callback... only for testing.
  String texts = '(to be filled by notifications)';
}
