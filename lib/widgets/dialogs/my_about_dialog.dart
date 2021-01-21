/*
 * Copyright (c) 2020. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:flutter/material.dart';

import '../../const/const.dart';

class MyAboutDialog extends StatelessWidget {
  const MyAboutDialog({Key key, this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final name = AppStrings.appName;
    final version = AppStrings.appVersion;
    // final Widget icon = Image.asset(
    //   Images.logo,
    //   width: 120,
    // );
    final Widget icon = FlutterLogo(size: 120);
    return AlertDialog(
      content: ListBody(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (icon != null)
                IconTheme(data: Theme.of(context).iconTheme, child: icon),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListBody(
                    children: <Widget>[
                      Text(name, style: Theme.of(context).textTheme.headline5),
                      Text(version,
                          style: Theme.of(context).textTheme.bodyText2),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ...?children,
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(AppStrings.dialogClose),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      scrollable: true,
    );
  }
}
