import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getx_app_template/const/const.dart';

class NoContent extends StatelessWidget {
  final String message;

  const NoContent({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Styles.lightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(8),
          Text(
            ':(',
            style: const TextStyle(
              fontSize: 56,
              color: Styles.accesoryGrey,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
