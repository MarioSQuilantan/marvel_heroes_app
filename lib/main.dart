import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes.dart';
import 'core/theme/theme.dart';
import 'features/character_comics/presentation/bloc/character_comics_bloc.dart';
import 'features/character_events/presentation/bloc/character_events_bloc.dart';
import 'features/character_series/presentation/bloc/character_series_bloc.dart';
import 'features/character_stories/presentation/bloc/character_stories_bloc.dart';
import 'features/characters/presentation/bloc/characters_bloc.dart';
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
        BlocProvider<CharacterComicsBloc>(create: (_) => di.locator<CharacterComicsBloc>()),
        BlocProvider<CharacterEventsBloc>(create: (_) => di.locator<CharacterEventsBloc>()),
        BlocProvider<CharacterSeriesBloc>(create: (_) => di.locator<CharacterSeriesBloc>()),
        BlocProvider<CharacterStoriesBloc>(create: (_) => di.locator<CharacterStoriesBloc>()),
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
