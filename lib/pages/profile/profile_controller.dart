import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/root/base_tab_controller.dart';
import 'package:getx_app_template/pages/root/models/nav_data.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:getx_app_template/services/session/models/user.dart';
import 'package:getx_app_template/widgets/dialogs/app_about_dialog.dart';
import 'package:getx_app_template/widgets/dialogs/close_session_dialog.dart';

import 'model/profile_model.dart';

class ProfileController extends BaseTabController
    with SingleGetTickerProviderMixin {
  static ProfileController get() => Get.find();
  static ProfileTabsData data = ProfileTabsData();

  bool canPop() => false;
  UserModel get user => SessionService.user;

  final int navId = NavKeys.PROFILE;

  final _userTitle = 'User'.obs;
  final _tabTitle = 'ACTIVITY'.obs;
  String get userTitle => _userTitle.value;
  String get tabTitle => _tabTitle.value;
  TabController tabController;
  List<TabMenuData> menuData = [];

  Future<void> handleCloseSession() async {
    final accepted = await Get.dialog<bool>(
      CloseSessionDialog(),
      transitionDuration: .26.seconds,
      transitionCurve: Curves.easeOutExpo,
    );
    if (accepted) {
      SessionService.get().logout();
    }
  }

  void showAbout() => Get.dialog(AppAboutDialog());

  @override
  void onInit() {
    super.onInit();
    _buildTabData();
    tabController = TabController(length: menuData.length, vsync: this);
    tabController.addListener(_handleTabChange);
    tabController.animation.addListener(_handleTabAnimation);
  }

  @override
  void onClose() {
    super.onClose();
    tabController?.removeListener(_handleTabChange);
    tabController?.dispose();
  }

  void _buildTabData() {
    menuData = List<TabMenuData>.from(data.tabMenu);
    if (!SessionService.user.isSeller) {
      menuData.removeWhere((e) => e.name == AppStrings.profileSales);
    }
  }

  TabMenuData get currentTabData => menuData[tabController.index];
  int get selectedTabIndex => tabController.index;

  void onTabTap(int idx) => tabController.animateTo(idx);

  void _handleTabAnimation() {
    var curr = tabController.animation.value;
    var diff = curr - tabController.index;
    if (diff != 0 && !tabController.indexIsChanging) {
      if (diff.abs() > .5) {
        if (Get.focusScope?.hasFocus ?? false) AppGetUtils.unfocus();
      }
    }
  }

  @override
  void onTabOpen() {
    Styles.statusIconsB();
  }

  @override
  void onTabClose() {
    print("Tab close!");
    tabController.index = 0;
  }

  void _handleTabChange() {
    final routeName = '/profile/$tabTitle';
    FirebaseService.analytics.sendScreen(routeName);
    AppGetUtils.unfocus();
    update(['menu']);
  }

  List<Widget> buildViewPages(Widget Function(TabMenuData) callback) {
    return menuData.map(callback).toList();
  }

  int get numTabs => menuData.length;

  Widget getPage(int idx) {
    return menuData[idx].view();
  }
}
