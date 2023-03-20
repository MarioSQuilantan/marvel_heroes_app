import '../../domain/entities/creators_item_entity.dart';

class CreatorsItemModel extends CreatorsItem {
  const CreatorsItemModel({
    required super.resourceUri,
    required super.name,
    required super.role,
  });

  factory CreatorsItemModel.fromJson(Map<String, dynamic> json) => CreatorsItemModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  factory CreatorsItemModel.fromEntity(CreatorsItem creatorsItem) => CreatorsItemModel(
        resourceUri: creatorsItem.resourceUri,
        name: creatorsItem.name,
        role: creatorsItem.role,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}
