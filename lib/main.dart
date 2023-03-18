import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marvel Heroes',
      theme: theme,
      routerConfig: AppRoutes.init,
      debugShowCheckedModeBanner: false,
    );
  }
}
