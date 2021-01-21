import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SPLASH!',
          style: TextStyle(fontSize: 90, color: Colors.black),
        ),
      ),
    );
  }
}
