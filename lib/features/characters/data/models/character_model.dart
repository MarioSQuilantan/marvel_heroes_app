import 'package:marvel_heroes_app/features/characters/data/models/data_model.dart';

import '../../domain/entities/characters/character_entity.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.code,
    required super.status,
    required super.copyright,
    required super.attributionText,
    required super.attributionHtml,
    required super.etag,
    required super.data,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": DataModel.fromEntity(data).toJson(),
      };

  Character toEntity() => Character(
        code: code,
        status: status,
        copyright: copyright,
        attributionText: attributionText,
        attributionHtml: attributionHtml,
        etag: etag,
        data: data,
      );
}
