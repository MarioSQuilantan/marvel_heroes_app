import '../../domain/entities/series_entity.dart';

class SeriesModel extends Series {
  const SeriesModel({
    required super.resourceUri,
    required super.name,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  factory SeriesModel.fromEntity(Series series) => SeriesModel(
        resourceUri: series.resourceUri,
        name: series.name,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
