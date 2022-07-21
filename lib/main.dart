import 'package:dpm_application/login_screen.dart';
import 'package:flutter/material.dart';

import 'core/util/theme_util.dart';
import 'otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeUtil.themeData,
      initialRoute: LoginScreen.id,
      home: const LoginScreen(),
    );
  }
}
