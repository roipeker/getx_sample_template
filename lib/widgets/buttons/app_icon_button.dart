import 'package:flutter/material.dart';
import 'package:getx_app_template/const/const.dart';

class AppIconButton extends StatelessWidget {
  final IconData iconData;
  final bool selected;
  final VoidCallback onTap;

  const AppIconButton({Key key, this.iconData, this.selected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selected ? Styles.green : Styles.lightGrey;
    return IconButton(
      enableFeedback: true,
      hoverColor: Styles.primaryColor.withOpacity(.08),
      highlightColor: Styles.primaryColor.withOpacity(.08),
      splashColor: Styles.primaryColor.withOpacity(.2),
      icon: Icon(iconData, size: 22, color: color),
      onPressed: onTap,
    );
  }
}
