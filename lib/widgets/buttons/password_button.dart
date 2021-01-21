import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';

import '../widgets.dart';

class PasswordButton extends StatelessWidget {
  final VoidCallback onTap;

  const PasswordButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.lock, color: Styles.primaryColor, size: 20),
            Gap(8),
            Text(AppStrings.changePassword),
          ],
        ),
      ),
    );
  }
}
