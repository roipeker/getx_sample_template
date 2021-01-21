import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/services/services.dart';

import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: WebUtils.removePreloader,
      debugShowCheckedModeBanner: false,
      enableLog: false,
      title: AppStrings.appName,
      color: Colors.red,
      defaultTransition: Transition.native,
      navigatorObservers: [...FirebaseService.analytics.getObservers()],
      theme: Styles.light,
      darkTheme: Styles.dark,
      locale: AppStrings.locale,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      builder: RootWidget.builder,
    );
  }
}
