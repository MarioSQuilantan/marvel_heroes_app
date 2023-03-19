import '../../domain/entities/comics_entity.dart';
import 'comics_item_model.dart';

class ComicsModel extends Comics {
  const ComicsModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory ComicsModel.fromJson(Map<String, dynamic> json) => ComicsModel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null ? [] : List<ComicsItemModel>.from(json["items"].map((x) => ComicsItemModel.fromJson(x))),
        returned: json["returned"],
      );

  factory ComicsModel.fromEntity(Comics comics) => ComicsModel(
        available: comics.available,
        collectionUri: comics.collectionUri,
        items: comics.items,
        returned: comics.returned,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null ? [] : items!.map((e) => ComicsItemModel.fromEntity(e).toJson()).toList(),
        "returned": returned,
      };
}
