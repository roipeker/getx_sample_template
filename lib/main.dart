import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    await AppServices.init();
    if (!kIsWeb) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }
    runApp(MyApp());
  }, (error, stackTrace) {
    print(
        'runZonedGuarded: Caught error in app, use `FirebaseCrashlytics` to track it down.');
    FirebaseService.get().recordError(error, stackTrace);
  });
}
