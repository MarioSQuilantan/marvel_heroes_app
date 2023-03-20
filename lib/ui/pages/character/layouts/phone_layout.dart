import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_routes.dart';
import '../../../../features/character_comics/presentation/bloc/character_comics_bloc.dart';
import '../../../../features/character_events/presentation/bloc/character_events_bloc.dart';
import '../../../../features/character_series/presentation/bloc/character_series_bloc.dart';
import '../../../../features/character_stories/presentation/bloc/character_stories_bloc.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';
import '../../widgets/character_card.dart';

class PhoneLayout extends StatefulWidget {
  const PhoneLayout({super.key, required this.result});
  final Result result;

  @override
  State<PhoneLayout> createState() => _PhoneLayoutState();
}

class _PhoneLayoutState extends State<PhoneLayout> {
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
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => AppRoutes.pop(context),
            );
          },
        ),
        title: AppText.paragraph(widget.result.name),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        children: [
          CharacterCard(
            imageUrl: '${widget.result.thumbnail.path}.${widget.result.thumbnail.extension}',
            name: widget.result.name,
            description: widget.result.description,
          ),
          const SizedBox(
            height: 22.0,
          ),
          BlocBuilder<CharacterComicsBloc, CharacterComicsState>(
            builder: (context, state) {
              if (state is CharacterComicsIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CharacterComicsHasData) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: AppText.h4('Comics'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12.0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.comics.data!.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (state.comics.data!.results!.isEmpty) {
                              return const AppText.paragraphBold('Comics are not available');
                            }
                            return AppText.paragraphBold(state.comics.data!.results![index].title!);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is CharacterComicsHasError) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CharacterComicsBloc>(context).add(GetCharacterComicsByIdEvent(widget.result.id)),
                    child: const Text('error fetching comics, please try again'),
                  ),
                );
              }
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CharacterComicsBloc>(context).add(GetCharacterComicsByIdEvent(widget.result.id)),
                  child: const Text('fetch data'),
                ),
              );
            },
          ),
          const SizedBox(
            height: 22.0,
          ),
          BlocBuilder<CharacterEventsBloc, CharacterEventsState>(
            builder: (context, state) {
              if (state is CharacterEventsIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CharacterEventsHasData) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: AppText.h4('Events'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12.0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.events.data!.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (state.events.data!.results!.isEmpty) {
                              return const AppText.paragraphBold('Comics are not available');
                            }
                            return AppText.paragraphBold(state.events.data!.results![index].title!);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is CharacterEventsHasError) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CharacterEventsBloc>(context).add(GetCharacterEventsByIdEvent(widget.result.id)),
                    child: const Text('error fetching events, please try again'),
                  ),
                );
              }
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CharacterEventsBloc>(context).add(GetCharacterEventsByIdEvent(widget.result.id)),
                  child: const Text('fetch data'),
                ),
              );
            },
          ),
          const SizedBox(
            height: 22.0,
          ),
          BlocBuilder<CharacterSeriesBloc, CharacterSeriesState>(
            builder: (context, state) {
              if (state is CharacterSeriesIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CharacterSeriesHasData) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: AppText.h4('Series'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12.0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.series.data!.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (state.series.data!.results!.isEmpty) {
                              return const AppText.paragraphBold('Comics are not available');
                            }
                            return AppText.paragraphBold(state.series.data!.results![index].title!);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is CharacterSeriesHasError) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(widget.result.id)),
                    child: const Text('error fetching events, please try again'),
                  ),
                );
              }
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(widget.result.id)),
                  child: const Text('fetch data'),
                ),
              );
            },
          ),
          const SizedBox(
            height: 22.0,
          ),
          BlocBuilder<CharacterStoriesBloc, CharacterStoriesState>(
            builder: (context, state) {
              if (state is CharacterStoriesIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CharacterStoriesHasData) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: AppText.h4('Stories'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12.0,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.stories.data!.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (state.stories.data!.results!.isEmpty) {
                              return const AppText.paragraphBold('Comics are not available');
                            }
                            return AppText.paragraphBold(state.stories.data!.results![index].title!);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is CharacterSeriesHasError) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(widget.result.id)),
                    child: const Text('error fetching stories, please try again'),
                  ),
                );
              }
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(widget.result.id)),
                  child: const Text('fetch data'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
