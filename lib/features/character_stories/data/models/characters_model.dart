import 'package:marvel_heroes_app/features/character_stories/data/models/original_issue_model.dart';

import '../../domain/entities/characters_entity.dart';

class CharactersModel extends Characters {
  const CharactersModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<OriginalIssueModel>.from(json["items"].map((x) => OriginalIssueModel.fromJson(x))),
        returned: json["returned"],
      );

  factory CharactersModel.fromEntity(Characters characters) => CharactersModel(
        available: characters.available,
        collectionUri: characters.collectionUri,
        items: characters.items,
        returned: characters.returned,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null ? [] : items!.map((e) => OriginalIssueModel.fromEntity(e).toJson()).toList(),
        "returned": returned,
      };
}
