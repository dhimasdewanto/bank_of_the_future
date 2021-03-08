import 'package:flutter/material.dart';

import 'core/app_settings.dart';
import 'features/register/presentation/widgets/register_email_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appName,
      home: RegisterEmailPage(),
    );
  }
}
