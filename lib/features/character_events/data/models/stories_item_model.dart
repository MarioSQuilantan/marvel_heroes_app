import '../../domain/entities/stories_item.entity.dart';

class StoriesItemModel extends StoriesItem {
  const StoriesItemModel({
    required super.resourceUri,
    required super.name,
    required super.type,
  });

  factory StoriesItemModel.fromJson(Map<String, dynamic> json) => StoriesItemModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  factory StoriesItemModel.fromEntity(StoriesItem storiesItem) => StoriesItemModel(
        resourceUri: storiesItem.resourceUri,
        name: storiesItem.name,
        type: storiesItem.type,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}
