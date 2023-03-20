import 'package:marvel_heroes_app/features/characters/domain/entities/characters/comics_item_entity.dart';

class ComicsItemModel extends ComicsItem {
  const ComicsItemModel({
    required super.resourceUri,
    required super.name,
  });

  factory ComicsItemModel.fromJson(Map<String, dynamic> json) => ComicsItemModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  factory ComicsItemModel.fromEntity(ComicsItem comicsItem) => ComicsItemModel(
        resourceUri: comicsItem.resourceUri,
        name: comicsItem.name,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };

  ComicsItem toEntity() => ComicsItem(
        resourceUri: resourceUri,
        name: name,
      );
}
