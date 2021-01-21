import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services.dart';

class StorageService extends GetxService implements BaseService {
  static StorageService get() => Get.find();
  final _log = AppLog('FirebaseService');

  GetStorage _box;
  bool _isFirstLaunch;

  bool get firstLaunch => _isFirstLaunch;

  String get apiToken => _box.read(_Keys.apiToken);
  set apiToken(String value) => _write(_Keys.apiToken, value);

  bool get themeIsDark => _box.read(_Keys.themeIsDark) ?? false;
  set themeIsDark(bool value) => _write(_Keys.themeIsDark, value);

  Map<String, dynamic> get apiUserData => _box.read(_Keys.apiUserInfo);
  set apiUserData(Map<String, dynamic> value) =>
      _write(_Keys.apiUserInfo, value);

  bool get settingsMemCache => _box.read(_Keys.settingsMemCache);
  set settingsMemCache(bool value) => _write(_Keys.settingsMemCache, value);

  bool get settingsDiskCache => _box.read(_Keys.settingsDiskCache);
  set settingsDiskCache(bool value) => _write(_Keys.settingsDiskCache, value);

  bool get settingsImageCache => _box.read(_Keys.settingsImageCache);
  set settingsImageCache(bool value) => _write(_Keys.settingsImageCache, value);

  bool get settingsDailyNotifications =>
      _box.read(_Keys.settingsDailyNotifications) ?? true;
  set settingsDailyNotifications(bool value) =>
      _write(_Keys.settingsDailyNotifications, value);

  @override
  Future<void> init() async {
    _box = GetStorage('settings');
    await _box.initStorage;
    _isFirstLaunch = _box.read(_Keys.firstLaunch) ?? true;
    if (_isFirstLaunch) {
      _box.write(_Keys.firstLaunch, false);
      settingsDailyNotifications = true;
    }
  }

  void reset() => _box.erase();
  void _write<T>(String key, T value) {
    value == null ? _box.remove(key) : _box.write(key, value);
  }
}

/// storage keys.
abstract class _Keys {
  static const String firstLaunch = 'first_launch';
  static const String apiToken = 'api_token';
  static const String apiUserInfo = 'api_user_info';

  static const String themeIsDark = 'theme_dark';
  static const String settingsMemCache = 'sett_mem_cache';
  static const String settingsDiskCache = 'sett_disk_cache';
  static const String settingsImageCache = 'sett_image_cache';
  static const String settingsDailyNotifications = 'sett_daily_notis';
}
