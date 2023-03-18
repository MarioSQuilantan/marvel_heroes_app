import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/values/constants.dart';
import 'ui/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static GoRouter get init => GoRouter(
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomePage(),
          ),
        ],
      );

  static void navigateTo(BuildContext context, String route) => context.go(route);
}
