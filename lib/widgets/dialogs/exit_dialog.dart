import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.exitDialogText),
      backgroundColor: Colors.white,
      actions: [
        FlatButton(onPressed: () => Get.back(result: false), child: Text("NO")),
        FlatButton(onPressed: () => Get.back(result: true), child: Text("YES")),
      ],
    );
  }
}
