import 'package:flutter/material.dart';
import 'package:marvel_heroes_app/ui/pages/home/widgets/phone_card_widget.dart';

import '../../../../app_routes.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../../widgets/app_text.dart';
import '../widgets/character_comics_card.dart';
import '../widgets/character_events_card.dart';
import '../widgets/character_series_card.dart';
import '../widgets/character_stories_card.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout({super.key, required this.result});
  final Result result;

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
        title: AppText.paragraph(result.name),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        children: [
          PhoneCard(
            imageUrl: '${result.thumbnail.path}.${result.thumbnail.extension}',
            name: result.name,
            description: result.description,
          ),
          const SizedBox(
            height: 22.0,
          ),
          CharacterComicsCard(result: result),
          const SizedBox(
            height: 22.0,
          ),
          CharacterEventsCard(result: result),
          const SizedBox(
            height: 22.0,
          ),
          CharacterSeriesCard(result: result),
          const SizedBox(
            height: 22.0,
          ),
          CharacterStoriesCard(result: result),
        ],
      ),
    );
  }
}
