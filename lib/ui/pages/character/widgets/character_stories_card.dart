import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/character_series/presentation/bloc/character_series_bloc.dart';
import '../../../../features/character_stories/presentation/bloc/character_stories_bloc.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';

class CharacterStoriesCard extends StatelessWidget {
  const CharacterStoriesCard({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterStoriesBloc, CharacterStoriesState>(
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
              onPressed: () => BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(result.id)),
              child: const Text('error fetching stories, please try again'),
            ),
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () => BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(result.id)),
            child: const Text('fetch data'),
          ),
        );
      },
    );
  }
}
