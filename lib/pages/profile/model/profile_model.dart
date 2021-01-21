import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/pages.dart';
import 'package:getx_app_template/pages/profile/tabs/favs/tab_favs_controller.dart';
import 'package:getx_app_template/pages/profile/tabs/favs/tab_favs_view.dart';
import 'package:getx_app_template/pages/profile/tabs/sales/tab_sales_controller.dart';
import 'package:getx_app_template/pages/profile/tabs/sales/tab_sales_view.dart';
import 'package:getx_app_template/pages/profile/tabs/stats/tab_stats_controller.dart';
import 'package:getx_app_template/pages/profile/tabs/stats/tab_stats_view.dart';
import 'package:getx_app_template/pages/profile/tabs/user_settings/user_settings_controller.dart';
import 'package:getx_app_template/pages/profile/tabs/user_settings/user_settings_view.dart';

class TabMenuData<T> {
  final String name;
  final IconData ico;
  final Widget Function() view;
  final T Function() controller;
  TabMenuData(this.name, this.ico, this.view, [this.controller]);
}

class ProfileTabsData {
  final List<TabMenuData> tabMenu = <TabMenuData>[
    TabMenuData<TabUserSettingsController>(
      AppStrings.profileSettings,
      Icons.settings,
      () => TabUserSettingsView(),
      () => TabUserSettingsController(),
    ),
    TabMenuData<TabSalesController>(
      AppStrings.profileSales,
      Icons.qr_code,
      () => TabSalesView(),
      () => TabSalesController(),
    ),
    TabMenuData<TabFavsController>(
      AppStrings.profileFavs,
      Icons.favorite,
      () => TabFavsView(),
      () => TabFavsController(),
    ),
    TabMenuData<TabStatsController>(
      AppStrings.profileStats,
      Icons.bar_chart,
      () => TabStatsView(),
      () => TabStatsController(),
    ),
  ];
}
