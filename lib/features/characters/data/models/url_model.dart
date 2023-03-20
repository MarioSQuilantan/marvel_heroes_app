import '../../domain/entities/characters/url_entity.dart';

class UrlModel extends Url {
  const UrlModel({
    required super.type,
    required super.url,
  });

  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
        type: json["type"],
        url: json["url"],
      );

  factory UrlModel.fromEntity(Url url) => UrlModel(
        type: url.type,
        url: url.url,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };

  Url toEntity() => Url(
        url: url,
        type: type,
      );
}
