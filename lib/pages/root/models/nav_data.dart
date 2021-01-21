import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/routes/routes.dart';
import '../../../const/const.dart';
import '../../pages.dart';

abstract class NavKeys {
  static const int HOME = 0;
  static const int MAP = 1;
  static const int PROFILE = 3;
}

class NavItem {
  final int navKey;
  final GetPage getPage;
  NavItem({this.navKey, this.getPage});
  PageRoute generateRoute(RouteSettings settings) {
    return GetPageRoute(
      page: getPage.page,
      routeName: getPage.name,
      binding: getPage.binding,
    );
  }
}

class NavItemData {
  final String name;
  final IconData icon;
  final String route; // Routes.SOMETHING
  final NavItem navItem;
  NavItemData({this.name, this.icon, this.navItem, this.route});
}

class NavData {
  final List<NavItemData> myData = [
    NavItemData(
      name: 'home',
      route: Routes.HOME,
      icon: Icons.home,
      navItem: NavItem(
        navKey: NavKeys.HOME,
        getPage: GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
          binding: BindingsBuilder.put(() => HomeController()),
        ),
      ),
    ),
    NavItemData(
      name: 'map',
      route: Routes.MAP,
      icon: Icons.map,
      navItem: NavItem(
        navKey: NavKeys.MAP,
        getPage: GetPage(
          name: Routes.MAP,
          page: () => MapView(),
          binding: BindingsBuilder.put(() => MapController()),
        ),
      ),
    ),
    NavItemData(
      name: 'sales',
      icon: Icons.qr_code,
      route: Routes.SALES,
    ),
    NavItemData(
      name: 'profile',
      route: Routes.PROFILE,
      icon: Icons.person,
      navItem: NavItem(
        navKey: NavKeys.PROFILE,
        getPage: GetPage(
          name: Routes.PROFILE,
          page: () => ProfileView(),
          binding: BindingsBuilder.put(() => ProfileController()),
        ),
      ),
    ),
  ];
}
