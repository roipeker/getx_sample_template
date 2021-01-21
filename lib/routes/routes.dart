import 'package:get/get.dart';
import 'package:getx_app_template/pages/pages.dart';

abstract class Routes {
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const SIGNUP = '/signup';

  static const ROOT = '/';
  // static const MEMBERSHIP = '/membership';
  // static const CAMPAIGN = '/campaign';
  static const ORDER_DETAILS = '/order';

  static const HOME = '/home';
  static const SALES = '/sales';
  static const PROFILE = '/profile';
  static const MAP = '/map';
}

abstract class AppPages {
  static String initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: BindingsBuilder.put(() => SignupController()),
    ),
    GetPage(
      name: Routes.ROOT,
      page: () => RootView(),
      binding: BindingsBuilder.put(() => RootController()),
    ),
    GetPage(
      name: Routes.SALES,
      page: () => SalesView(),
      binding: BindingsBuilder(() => Get.put(SalesController())),
    ),
  ];
}
