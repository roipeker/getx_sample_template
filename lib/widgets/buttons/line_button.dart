import 'package:flutter/material.dart';

class LineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double width;

  const LineButton({Key key, this.label, this.onTap, this.width = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 17,
      letterSpacing: -.15,
      color: const Color(0xff808080),
      fontWeight: FontWeight.w400,
    );
    return SizedBox(
        width: width,
        child: OutlineButton(
          onPressed: onTap,
          child: Text(
            '$label',
            style: style,
          ),
        ));
  }
}
