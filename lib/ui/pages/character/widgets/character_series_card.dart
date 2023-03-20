import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/character_series/presentation/bloc/character_series_bloc.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';

class CharacterSeriesCard extends StatelessWidget {
  const CharacterSeriesCard({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterSeriesBloc, CharacterSeriesState>(
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
              onPressed: () => BlocProvider.of<CharacterSeriesBloc>(context).add(GetCharacterSeriesByIdEvent(result.id)),
              child: const Text('error fetching events, please try again'),
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
