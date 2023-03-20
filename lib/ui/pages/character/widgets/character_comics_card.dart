import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/character_comics/presentation/bloc/character_comics_bloc.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';

class CharacterComicsCard extends StatelessWidget {
  const CharacterComicsCard({super.key, required this.result});
  final Result result;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterComicsBloc, CharacterComicsState>(
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
              onPressed: () => BlocProvider.of<CharacterComicsBloc>(context).add(GetCharacterComicsByIdEvent(result.id)),
              child: const Text('error fetching comics, please try again'),
            ),
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () => BlocProvider.of<CharacterComicsBloc>(context).add(GetCharacterComicsByIdEvent(result.id)),
            child: const Text('fetch data'),
          ),
        );
      },
    );
  }
}
