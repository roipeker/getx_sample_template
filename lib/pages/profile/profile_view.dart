import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/services/services.dart';

import 'profile_controller.dart';
import 'widgets/profile_header_menu.dart';
import 'widgets/profile_header_user.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(32),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileHeaderUserPane(),
                        Spacer(),
                        IconButton(
                          color: Styles.lightGrey,
                          iconSize: 18,
                          hoverColor: Styles.primaryColor.withOpacity(.08),
                          highlightColor: Styles.primaryColor.withOpacity(.08),
                          splashColor: Styles.primaryColor.withOpacity(.2),
                          icon: Icon(Icons.widgets),
                          onPressed: () => controller.showAbout(),
                        ),
                      ],
                    ),
                    ProfileHeaderMenu(),
                  ],
                ),
              ),
              const Divider(
                  color: Styles.dividerGray,
                  thickness: 1,
                  height: 1,
                  indent: 12,
                  endIndent: 12),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: controller.buildViewPages((e) => e.view()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
