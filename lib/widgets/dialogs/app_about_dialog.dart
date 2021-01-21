import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/services/services.dart';

import '../widgets.dart';
import 'my_about_dialog.dart';

class AppAboutDialog extends GetView<SettingsService> {
  static final smallLetter = Styles.compraListComercioTextStyle.copyWith(
    fontSize: 11,
  );
  static final bigTitle = Styles.compraListDateTextStyle.copyWith(
    fontSize: 13,
  );

  @override
  Widget build(BuildContext context) {
    return MyAboutDialog(
      children: [
        if (FirebaseService.get().fcmEnabled)
          _buildSwitch(
            controller.useDailyNotifications,
            'notifications',
            'show daily notifications',
          ),

        _buildSwitch(
          controller.useMemCache,
          'mem cache',
          'keeps the downloaded data while the app is open',
        ),
        _buildSwitch(
          controller.useDiskCache,
          'disk cache',
          'for network requests',
        ),
//        if (!GetPlatform.isWeb)
        _buildSwitch(
          controller.useImageCache,
          'image cache',
          'keeps the downloaded photos in disk.',
        ),
        const Gap(12),
        _addButton('remove all cache', controller.clearCache),
        if (FirebaseService.get().crashlyticsEnabled)
          _addButton('crash app test', controller.crashAppTest),

        if (FirebaseService.get().crashlyticsEnabled)
          _addButton('throw exception test', controller.throwExceptionTest),

        if (FirebaseService.get().fcmEnabled)
          _addButton('FCM token', controller.copyToken),
        // if (FirebaseService.get().fcmEnabled)
        //   _addButton('FCM messages', controller.showLoadNotifications),
        if (FirebaseService.get().fcmEnabled)
          _addButton('FCM test', controller.testFCM),

        if (FirebaseService.get().fcmEnabled) const Gap(12),

        OutlineButton(
            onPressed: controller.clearCache,
            child: Text('clear all cache', style: bigTitle)),

        const Gap(24),

        Text("developed by roipeker", style: smallLetter),
      ],
    );
  }

  Widget _buildSwitch(RxBool flag, String title, String subtitle) {
    return Obx(
      () => SwitchListTile.adaptive(
        title: Text(title, style: bigTitle),
        subtitle: Text(subtitle, style: smallLetter),
        dense: true,
        value: flag(),
        onChanged: flag,
      ),
    );
  }

  Widget _addButton(String label, VoidCallback callback) {
    return OutlineButton(
      onPressed: callback,
      child: Text(label, style: bigTitle),
    );
  }
}
