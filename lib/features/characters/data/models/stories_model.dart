import '../../domain/entities/characters/stories_entity.dart';
import 'stories_item_model.dart';

class StoriesModel extends Stories {
  const StoriesModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItemModel>.from(json["items"].map((x) => StoriesItemModel.fromJson(x))),
        returned: json["returned"],
      );

  factory StoriesModel.fromEntity(Stories stories) => StoriesModel(
        available: stories.available,
        collectionUri: stories.collectionUri,
        items: stories.items,
        returned: stories.returned,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null ? [] : items!.map((e) => StoriesItemModel.fromEntity(e).toJson()).toList(),
        "returned": returned,
      };

  Stories toEntity() => Stories(
        available: available,
        collectionUri: collectionUri,
        items: items,
        returned: returned,
      );
}
