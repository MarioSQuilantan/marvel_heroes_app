import '../../domain/entities/result_entity_dart.dart';
import 'characters_model.dart';
import 'creators_model.dart';
import 'original_issue_model.dart';

class ResultModel extends Result {
  const ResultModel({
    required super.id,
    required super.title,
    required super.description,
    required super.resourceUri,
    required super.type,
    required super.modified,
    required super.thumbnail,
    required super.creators,
    required super.characters,
    required super.series,
    required super.comics,
    required super.events,
    required super.originalIssue,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: json["thumbnail"],
        creators: json["creators"] == null ? null : CreatorsModel.fromJson(json["creators"]),
        characters: json["characters"] == null ? null : CharactersModel.fromJson(json["characters"]),
        series: json["series"] == null ? null : CharactersModel.fromJson(json["series"]),
        comics: json["comics"] == null ? null : CharactersModel.fromJson(json["comics"]),
        events: json["events"] == null ? null : CharactersModel.fromJson(json["events"]),
        originalIssue: json["originalIssue"] == null ? null : OriginalIssueModel.fromJson(json["originalIssue"]),
      );

  factory ResultModel.fromEntity(Result result) => ResultModel(
        id: result.id,
        title: result.title,
        description: result.description,
        resourceUri: result.resourceUri,
        type: result.type,
        modified: result.modified,
        thumbnail: result.thumbnail,
        creators: result.creators,
        characters: result.characters,
        series: result.series,
        comics: result.comics,
        events: result.events,
        originalIssue: result.originalIssue,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail,
        "creators": CreatorsModel.fromEntity(creators!).toJson(),
        "characters": CharactersModel.fromEntity(characters!).toJson(),
        "series": CharactersModel.fromEntity(series!).toJson(),
        "comics": CharactersModel.fromEntity(comics!).toJson(),
        "events": CharactersModel.fromEntity(events!).toJson(),
        "originalIssue": OriginalIssueModel.fromEntity(originalIssue!).toJson(),
      };
}
