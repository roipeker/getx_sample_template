/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/routes/routes.dart';

import '../../services/firebase/firebase_service.dart';
import '../../utils/native_utils.dart';
import '../../widgets/dialogs/exit_dialog.dart';
import '../pages.dart';
import 'models/nav_data.dart';

class RootController extends GetxController {
  final _navData = NavData();

//  List<NavBarItem> get menuData => _navData.menuData;
  List<NavItemData> get menuData {
    /// get a copy of the data... in case we need to customize it.
    final output = List<NavItemData>.from(_navData.myData);
    // if (!SessionService.user.isSeller) {
    //   list.removeWhere((e) => e.route == Pages.SALE);
    // }
    return output;
  }

  int getNavItemIndexByNavKey(int navKey) {
    return menuData.indexWhere((e) => e?.navItem?.navKey == navKey);
  }

  final selectedNav = 0.obs;
  final _pages = <Widget>[];

  @override
  void onInit() {
    super.onInit();
    _currentModel = menuData.first;
  }

  List<Widget> getPages() {
//    _pages.clear();
    if (_pages.isEmpty) {
      _pages.addAll(menuData.map(
        (e) {
          if (e.navItem != null) {
            return Navigator(
              key: Get.nestedKey(e.navItem.navKey),
              onGenerateRoute: e.navItem.generateRoute,
            );
          } else {
            return Container();
          }
        },
      ));
    }
    return _pages;
  }

  NavItemData _currentModel;

  Future<void> onTapNav(int idx) async {
    /// only for VENTA we make a special case...
    final model = menuData[idx];
    if (model.route == Routes.SALES) {
      Get.toNamed(Routes.SALES);
    } else {
      if (model != _currentModel) {
        _currentModel = model;
        if (model.route != null) {
          FirebaseService.analytics.sendScreen(model.route);
        }
      } else {
        final navKey = Get.nestedKey(_currentModel.navItem.navKey);
        if (navKey.currentState.canPop()) {
//          navKey.currentState.pop();
          await canPop();
        }
      }
      selectedNav(idx);
    }
  }

  Widget getPage() {
    final model = menuData[selectedNav()];
    if (model.navItem != null) {
      return Navigator(
        key: Get.nestedKey(model.navItem.navKey),
        initialRoute: '/',
        onGenerateRoute: model.navItem.generateRoute,
      );
    } else {
      return Container();
    }
  }

  Future<bool> canPop() async {
    return Future.value(false);
    final navKey = Get.nestedKey(_currentModel.navItem.navKey);
    if (navKey.currentState.canPop()) {
      var result = true;
      if (_currentModel.route == Routes.HOME) {
        /// analyze each controller
        result = HomeController.get().canPop();
      } else if (_currentModel.route == Routes.PROFILE) {
        result = ProfileController.get().canPop();
      }
      if (result) {
        navKey.currentState.pop();
      }
      return Future.value(false);
    } else {
      print("Trying to close ROOT!");
      if (GetPlatform.isAndroid) {
        if (!Get.isDialogOpen) {
          final result = (await Get.dialog(ExitDialog()) as bool) ?? false;
          if (result) {
            AppNativeUtils.toBackground();
          }
        }
      } else {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
}
