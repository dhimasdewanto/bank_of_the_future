import 'package:flutter/material.dart';

import 'core/app_settings.dart';
import 'core/injection.dart';
import 'core/theme_data.dart';
import 'features/register/presentation/controllers/register/register_controller.dart';
import 'features/register/presentation/pages/register_email_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const RegisterEmailPage(),
      theme: themeData,
      builder: (context, child) {
        return RegisterController(
          processEmail: processEmail,
          child: child ?? const Offstage(),
        );
      },
    );
  }
}
