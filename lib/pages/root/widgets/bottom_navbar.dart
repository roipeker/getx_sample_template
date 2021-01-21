import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';

import '../root_controller.dart';

class AppBottomNavBar extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    final items = controller.menuData
        .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.name))
        .toList();
    return Obx(
      () => BottomNavigationBar(
        items: items,
        elevation: 8,
        iconSize: 18,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Styles.primaryColor),
        unselectedIconTheme: IconThemeData(color: Styles.accesoryGrey),
        onTap: (idx) => controller.onTapNav(idx),
        currentIndex: controller.selectedNav(),
      ),
    );
  }
}
