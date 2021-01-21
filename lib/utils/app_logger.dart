class AppLog {
  String prefix;

  AppLog(String classname) {
    prefix = '[$classname]';
  }
  void call(params) {
    print(prefix + ' $params');
  }
}
