import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/layout/screen_layout.dart';
import '../../../features/character_comics/presentation/bloc/character_comics_bloc.dart';
import '../../../features/character_events/presentation/bloc/character_events_bloc.dart';
import '../../../features/character_series/presentation/bloc/character_series_bloc.dart';
import '../../../features/character_stories/presentation/bloc/character_stories_bloc.dart';
import '../../../features/characters/domain/entities/characters/result_entity.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/phone_layout.dart';
import 'layouts/tablet_layout.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
    required this.result,
  });

  final Result result;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CharacterComicsBloc>(context).add(GetCharacterComicsByIdEvent(widget.result.id));
      BlocProvider.of<CharacterEventsBloc>(context).add(GetCharacterEventsByIdEvent(widget.result.id));
      BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(widget.result.id));
      BlocProvider.of<CharacterStoriesBloc>(context).add(GetCharacterStoriesByIdEvent(widget.result.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenLayout(
        mobileLayout: PhoneLayout(result: widget.result),
        tabletLayout: TabletLayout(result: widget.result),
        desktopLayout: const DesktopLayout(),
      ),
    );
  }
}
