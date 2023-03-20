import '../../domain/entities/text_object_entity.dart';

class TextObjectModel extends TextObject {
  const TextObjectModel({
    required super.type,
    required super.language,
    required super.text,
  });

  factory TextObjectModel.fromJson(Map<String, dynamic> json) => TextObjectModel(
        type: json["type"],
        language: json["language"],
        text: json["text"],
      );

  factory TextObjectModel.fromEntity(TextObject textObject) => TextObjectModel(
        type: textObject.type,
        language: textObject.language,
        text: textObject.text,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "language": language,
        "text": text,
      };
}
