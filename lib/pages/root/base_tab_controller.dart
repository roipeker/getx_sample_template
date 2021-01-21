import 'package:get/get.dart';
import 'root_controller.dart';

abstract class BaseTabController extends GetxController {
  final int navId = null;
  bool _isTabOpen = false;

  RootController get rootController => Get.find();

  BaseTabController() {
    final myNavIndex = rootController.getNavItemIndexByNavKey(navId);
    ever(rootController.selectedNav, (int value) {
      if (myNavIndex != null && myNavIndex == value) {
        _isTabOpen = true;
        onTabOpen();
      } else {
        if (_isTabOpen) {
          _isTabOpen = false;
          onTabClose();
        }
      }
    });
  }
  void onTabOpen() {}
  void onTabClose() {}
}
