import 'package:flutter/material.dart';
import 'package:getx_app_template/services/services.dart';

class TestNotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = FirebaseService.get().texts ?? 'NO NOTIFICATIONS.';
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(str, style: TextStyle(fontSize: 12, color: Colors.black)),
      ),
    );
  }
}
