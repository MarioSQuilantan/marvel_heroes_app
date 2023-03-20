import '../../domain/entities/character_stories_entity.dart';
import 'data_model.dart';

class CharacterStoriesModel extends CharacterStories {
  const CharacterStoriesModel({
    required super.code,
    required super.status,
    required super.copyright,
    required super.attributionText,
    required super.attributionHtml,
    required super.etag,
    required super.data,
  });

  factory CharacterStoriesModel.fromJson(Map<String, dynamic> json) => CharacterStoriesModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
      );

  CharacterStories toEntity() => CharacterStories(
        code: code,
        status: status,
        copyright: copyright,
        attributionText: attributionText,
        attributionHtml: attributionHtml,
        etag: etag,
        data: data,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": DataModel.fromEntity(data!).toJson(),
      };
}
