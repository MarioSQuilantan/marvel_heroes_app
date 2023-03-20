import '../../domain/entities/result_entity.dart';
import 'characters_model.dart';
import 'creators_model.dart';
import 'next_model.dart';
import 'stories_model.dart';
import 'thumbnail_model.dart';
import 'url_model.dart';

class ResultModel extends Result {
  const ResultModel({
    required super.id,
    required super.title,
    required super.description,
    required super.resourceUri,
    required super.urls,
    required super.modified,
    required super.start,
    required super.end,
    required super.thumbnail,
    required super.creators,
    required super.characters,
    required super.stories,
    required super.comics,
    required super.series,
    required super.next,
    required super.previous,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null ? [] : List<UrlModel>.from(json["urls"].map((x) => UrlModel.fromJson(x))),
        modified: json["modified"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        thumbnail: json["thumbnail"] == null ? null : ThumbnailModel.fromJson(json["thumbnail"]),
        creators: json["creators"] == null ? null : CreatorsModel.fromJson(json["creators"]),
        characters: json["characters"] == null ? null : CharactersModel.fromJson(json["characters"]),
        stories: json["stories"] == null ? null : StoriesModel.fromJson(json["stories"]),
        comics: json["comics"] == null ? null : CharactersModel.fromJson(json["comics"]),
        series: json["series"] == null ? null : CharactersModel.fromJson(json["series"]),
        next: json["next"] == null ? null : NextModel.fromJson(json["next"]),
        previous: json["previous"] == null ? null : NextModel.fromJson(json["previous"]),
      );

  factory ResultModel.fromEntity(Result result) => ResultModel(
        id: result.id,
        title: result.title,
        description: result.description,
        resourceUri: result.resourceUri,
        urls: result.urls,
        modified: result.modified,
        start: result.start,
        end: result.end,
        thumbnail: result.thumbnail,
        creators: result.creators,
        characters: result.characters,
        stories: result.stories,
        comics: result.comics,
        series: result.series,
        next: result.next,
        previous: result.previous,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": urls == null ? [] : urls!.map((e) => UrlModel.fromEntity(e).toJson()).toList(),
        "modified": modified,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "thumbnail": ThumbnailModel.fromEntity(thumbnail!).toJson(),
        "creators": CreatorsModel.fromEntity(creators!).toJson(),
        "characters": CharactersModel.fromEntity(characters!).toJson(),
        "stories": StoriesModel.fromEntity(stories!).toJson(),
        "comics": CharactersModel.fromEntity(comics!).toJson(),
        "series": CharactersModel.fromEntity(comics!).toJson(),
        "next": NextModel.fromEntity(next!).toJson(),
        "previous": NextModel.fromEntity(previous!).toJson(),
      };
}
