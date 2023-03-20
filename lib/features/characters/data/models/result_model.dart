import 'comics_model.dart';
import 'stories_model.dart';
import 'thumbnail_model.dart';
import 'url_model.dart';

import '../../domain/entities/characters/result_entity.dart';

class ResultModel extends Result {
  const ResultModel({
    required super.id,
    required super.name,
    required super.description,
    required super.modified,
    required super.thumbnail,
    required super.resourceUri,
    required super.comics,
    required super.series,
    required super.stories,
    required super.events,
    required super.urls,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: ThumbnailModel.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: json["comics"] == null ? null : ComicsModel.fromJson(json["comics"]),
        series: json["series"] == null ? null : ComicsModel.fromJson(json["series"]),
        stories: json["stories"] == null ? null : StoriesModel.fromJson(json["stories"]),
        events: json["events"] == null ? null : ComicsModel.fromJson(json["events"]),
        urls: json["urls"] == null ? [] : List<UrlModel>.from(json["urls"].map((x) => UrlModel.fromJson(x))),
      );

  factory ResultModel.fromEntity(Result result) => ResultModel(
        id: result.id,
        name: result.name,
        description: result.description,
        modified: result.modified,
        thumbnail: result.thumbnail,
        resourceUri: result.resourceUri,
        comics: result.comics,
        series: result.series,
        stories: result.stories,
        events: result.events,
        urls: result.urls,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": ThumbnailModel.fromEntity(thumbnail).toJson(),
        "resourceURI": resourceUri,
        "comics": ComicsModel.fromEntity(comics!).toJson(),
        "series": ComicsModel.fromEntity(series!).toJson(),
        "stories": StoriesModel.fromEntity(stories!).toJson(),
        "events": ComicsModel.fromEntity(events!).toJson(),
        "urls": urls == null ? [] : urls!.map((e) => UrlModel.fromEntity(e).toJson()).toList(),
      };
}
