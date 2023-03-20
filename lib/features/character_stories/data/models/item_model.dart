import '../../domain/entities/item_entity.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.resourceUri,
    required super.name,
    required super.role,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  factory ItemModel.fromEntity(Item item) => ItemModel(
        resourceUri: item.resourceUri,
        name: item.name,
        role: item.role,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}
