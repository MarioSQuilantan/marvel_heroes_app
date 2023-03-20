import '../../domain/entities/creators_entity.dart';
import 'creators_item_model.dart';

class CreatorsModel extends Creators {
  const CreatorsModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory CreatorsModel.fromJson(Map<String, dynamic> json) => CreatorsModel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items:
            json["items"] == null ? [] : List<CreatorsItemModel>.from(json["items"].map((x) => CreatorsItemModel.fromJson(x))),
        returned: json["returned"],
      );

  factory CreatorsModel.fromEntity(Creators creators) => CreatorsModel(
        available: creators.available,
        collectionUri: creators.collectionUri,
        items: creators.items,
        returned: creators.returned,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null ? [] : items!.map((e) => CreatorsItemModel.fromEntity(e).toJson()).toList(),
        "returned": returned,
      };
}
