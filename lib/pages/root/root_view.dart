import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'root_controller.dart';
import 'widgets/bottom_navbar.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.canPop,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedNav(),
            children: controller.getPages(),
          ),
        ),
        bottomNavigationBar: AppBottomNavBar(),
      ),
    );
  }
}
