import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoPanelViewer extends StatelessWidget {
  final bool isFirst;
  final Widget child1;
  final Widget child2;
  final CrossFadeState crossfade;
  final Duration duration;

  const TwoPanelViewer({
    Key key,
    this.duration,
    this.isFirst,
    this.child1,
    this.child2,
    this.crossfade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: duration ?? .35.seconds,
      reverseDuration: .2.seconds,
      firstCurve: Curves.easeOutExpo,
      secondCurve: Curves.easeOutExpo,
      sizeCurve: Curves.decelerate,
      firstChild: IgnorePointer(
        ignoring: !isFirst,
        ignoringSemantics: !isFirst,
        child: child1,
      ),
      secondChild: IgnorePointer(
        ignoring: isFirst,
        ignoringSemantics: isFirst,
        child: child2,
      ),
      crossFadeState: crossfade,
    );
  }
}
