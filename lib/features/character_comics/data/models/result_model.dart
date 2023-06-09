import '../../domain/entities/result_entity.dart';
import 'characters_model.dart';
import 'creators_model.dart';
import 'date_model.dart';
import 'price_model.dart';
import 'series_model.dart';
import 'stories_model.dart';
import 'text_object_model.dart';
import 'thumbnail_model.dart';
import 'url_model.dart';

class ResultModel extends Result {
  const ResultModel({
    required super.id,
    required super.digitalId,
    required super.title,
    required super.issueNumber,
    required super.variantDescription,
    required super.description,
    required super.modified,
    required super.isbn,
    required super.upc,
    required super.diamondCode,
    required super.ean,
    required super.issn,
    required super.format,
    required super.pageCount,
    required super.textObjects,
    required super.resourceUri,
    required super.urls,
    required super.series,
    required super.variants,
    required super.collections,
    required super.collectedIssues,
    required super.dates,
    required super.prices,
    required super.thumbnail,
    required super.images,
    required super.creators,
    required super.characters,
    required super.stories,
    required super.events,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: json["textObjects"] == null
            ? []
            : List<TextObjectModel>.from(json["textObjects"].map((x) => TextObjectModel.fromJson(x))),
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null ? [] : List<UrlModel>.from(json["urls"].map((x) => UrlModel.fromJson(x))),
        series: json["series"] == null ? null : SeriesModel.fromJson(json["series"]),
        variants: json["variants"] == null ? [] : List<SeriesModel>.from(json["variants"].map((x) => SeriesModel.fromJson(x))),
        collections: json["collections"] == null ? [] : List<dynamic>.from(json["collections"]!.map((x) => x)),
        collectedIssues: json["collectedIssues"] == null ? [] : List<dynamic>.from(json["collectedIssues"]!.map((x) => x)),
        dates: json["dates"] == null ? [] : List<DateModel>.from(json["dates"].map((x) => DateModel.fromJson(x))),
        prices: json["prices"] == null ? [] : List<PriceModel>.from(json["prices"].map((x) => PriceModel.fromJson(x))),
        thumbnail: json["thumbnail"] == null ? null : ThumbnailModel.fromJson(json["thumbnail"]),
        images: json["images"] == null ? [] : List<ThumbnailModel>.from(json["images"].map((x) => ThumbnailModel.fromJson(x))),
        creators: json["creators"] == null ? null : CreatorsModel.fromJson(json["creators"]),
        characters: json["characters"] == null ? null : CharactersModel.fromJson(json["characters"]),
        stories: json["stories"] == null ? null : StoriesModel.fromJson(json["stories"]),
        events: json["events"] == null ? null : CharactersModel.fromJson(json["events"]),
      );

  factory ResultModel.fromEntity(Result result) => ResultModel(
        id: result.id,
        digitalId: result.digitalId,
        title: result.title,
        issueNumber: result.issueNumber,
        variantDescription: result.variantDescription,
        description: result.description,
        modified: result.modified,
        isbn: result.isbn,
        upc: result.upc,
        diamondCode: result.diamondCode,
        ean: result.ean,
        issn: result.issn,
        format: result.format,
        pageCount: result.pageCount,
        textObjects: result.textObjects,
        resourceUri: result.resourceUri,
        urls: result.urls,
        series: result.series,
        variants: result.variants,
        collections: result.collections,
        collectedIssues: result.collectedIssues,
        dates: result.dates,
        prices: result.prices,
        thumbnail: result.thumbnail,
        images: result.images,
        creators: result.creators,
        characters: result.characters,
        stories: result.stories,
        events: result.events,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects": textObjects == null ? [] : textObjects!.map((e) => TextObjectModel.fromEntity(e).toJson()).toList(),
        "resourceURI": resourceUri,
        "urls": urls == null ? [] : urls!.map((e) => UrlModel.fromEntity(e).toJson()).toList(),
        "series": SeriesModel.fromEntity(series!).toJson(),
        "variants": variants == null ? [] : variants!.map((e) => SeriesModel.fromEntity(e).toJson()).toList(),
        "collections": collections == null ? [] : List<dynamic>.from(collections!.map((x) => x)),
        "collectedIssues": collectedIssues == null ? [] : List<dynamic>.from(collectedIssues!.map((x) => x)),
        "dates": dates == null ? [] : dates!.map((e) => DateModel.fromEntity(e).toJson()).toList(),
        "prices": prices == null ? [] : prices!.map((e) => PriceModel.fromEntity(e).toJson()).toList(),
        "thumbnail": ThumbnailModel.fromEntity(thumbnail!).toJson(),
        "images": images == null ? [] : images!.map((e) => ThumbnailModel.fromEntity(e).toJson()).toList(),
        "creators": CreatorsModel.fromEntity(creators!).toJson(),
        "characters": CharactersModel.fromEntity(characters!).toJson(),
        "stories": StoriesModel.fromEntity(stories!).toJson(),
        "events": CharactersModel.fromEntity(events!).toJson(),
      };
}
