import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/result_entity.dart';
import 'package:marvel_heroes_app/ui/pages/character/character_page.dart';

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
          GoRoute(
            path: Routes.character,
            builder: (context, state) {
              Result result = state.extra as Result;
              return CharacterPage(
                result: result,
              );
            },
          ),
        ],
      );

  static void navigateTo(BuildContext context, String route) => context.go(route);
  static void pop(BuildContext context) => context.pop();
  static void push(BuildContext context, String route, {Object? extra}) => context.push(route, extra: extra);
}
