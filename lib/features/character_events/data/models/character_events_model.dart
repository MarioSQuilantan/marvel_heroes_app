import '../../domain/entities/character_events_entity.dart';
import 'data_model.dart';

class CharacterEventsModel extends CharacterEvents {
  const CharacterEventsModel({
    required super.code,
    required super.status,
    required super.copyright,
    required super.attributionText,
    required super.attributionHtml,
    required super.etag,
    required super.data,
  });

  factory CharacterEventsModel.fromJson(Map<String, dynamic> json) => CharacterEventsModel(
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

  CharacterEvents toEntity() => CharacterEvents(
        code: code,
        status: status,
        copyright: copyright,
        attributionText: attributionText,
        attributionHtml: attributionHtml,
        etag: etag,
        data: data,
      );
}
