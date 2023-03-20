import '../../domain/entities/character_comics_entity.dart';
import 'data_model.dart';

class CharacterComicsModel extends CharacterComics {
  const CharacterComicsModel({
    required super.code,
    required super.status,
    required super.copyright,
    required super.attributionText,
    required super.attributionHtml,
    required super.etag,
    required super.data,
  });

  factory CharacterComicsModel.fromJson(Map<String, dynamic> json) => CharacterComicsModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
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

  CharacterComics toEntity() => CharacterComics(
        code: code,
        status: status,
        copyright: copyright,
        attributionText: attributionText,
        attributionHtml: attributionHtml,
        etag: etag,
        data: data,
      );
}
