import '../../domain/entities/characters/thumbnail_entity.dart';

class ThumbnailModel extends Thumbnail {
  const ThumbnailModel({
    required super.path,
    required super.extension,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) => ThumbnailModel(
        path: json["path"],
        extension: json["extension"],
      );

  factory ThumbnailModel.fromEntity(Thumbnail thumbnail) => ThumbnailModel(
        path: thumbnail.path,
        extension: thumbnail.extension,
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };

  Thumbnail toEntity() => Thumbnail(
        path: path,
        extension: extension,
      );
}
