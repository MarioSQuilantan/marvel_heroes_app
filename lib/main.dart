import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_heroes_app/features/characters/presentation/bloc/characters_bloc.dart';

import 'app_routes.dart';
import 'core/theme/theme.dart';
import 'injector.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(create: (_) => di.locator<CharactersBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Marvel Heroes',
        theme: theme,
        routerConfig: AppRoutes.init,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
