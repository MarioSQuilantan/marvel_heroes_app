import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/character_events/presentation/bloc/character_events_bloc.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';

class CharacterEventsCard extends StatelessWidget {
  const CharacterEventsCard({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterEventsBloc, CharacterEventsState>(
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
              onPressed: () => BlocProvider.of<CharacterEventsBloc>(context).add(GetCharacterEventsByIdEvent(result.id)),
              child: const Text('error fetching events, please try again'),
            ),
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () => BlocProvider.of<CharacterEventsBloc>(context).add(GetCharacterEventsByIdEvent(result.id)),
            child: const Text('fetch data'),
          ),
        );
      },
    );
  }
}
