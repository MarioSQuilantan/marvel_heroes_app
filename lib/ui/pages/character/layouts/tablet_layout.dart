import 'package:flutter/material.dart';
import 'package:marvel_heroes_app/ui/pages/character/widgets/character_comics_card.dart';

import '../../home/widgets/tablet_card_widget.dart';
import '../../widgets/app_text.dart';
import '../../../../features/characters/domain/entities/characters/result_entity.dart';
import '../widgets/character_events_card.dart';
import '../widgets/character_series_card.dart';
import '../widgets/character_stories_card.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.paragraph(result.name),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        children: [
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TabletCard(
                imageUrl: '${result.thumbnail.path}.${result.thumbnail.extension}',
                name: result.name,
                description: result.description,
              ),
              ListView(
                shrinkWrap: true,
                children: [
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
