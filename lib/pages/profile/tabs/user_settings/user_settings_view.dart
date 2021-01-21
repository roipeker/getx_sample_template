import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/pages/profile/tabs/user_settings/user_settings_controller.dart';

import '../../../../const/theme/styles.dart';
import '../../../../widgets/widgets.dart';
import 'widgets/change_password_pane.dart';
import 'widgets/user_info_pane.dart';

class TabUserSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TabUserSettingsController(),
      builder: (_) => _TabUserSettingsView(),
    );
  }
}

class _TabUserSettingsView extends GetView<TabUserSettingsController> {
  @override
  Widget build(BuildContext context) {
    Styles.overlayWhite();
    var isFirst = controller.isShowingUserInfo;
    context.theme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: TwoPanelViewer(
                child1: UserInfoPane(),
                child2: ChangePasswordPane(),
                crossfade: controller.crossFadeState,
                isFirst: isFirst,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
