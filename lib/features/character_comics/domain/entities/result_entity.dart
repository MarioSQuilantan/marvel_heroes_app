import 'package:equatable/equatable.dart';

import 'characters_entity.dart';
import 'creators_entity.dart';
import 'date_entity.dart';
import 'price_entity.dart';
import 'series_entity.dart';
import 'stories_entity.dart';
import 'text_object_entity.dart';
import 'thumbnail_entity.dart';
import 'url_entity.dart';

class Result extends Equatable {
  const Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  final int? id;
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<dynamic>? collections;
  final List<dynamic>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? events;

  @override
  List<Object?> get props => [
        id,
        digitalId,
        title,
        issueNumber,
        variantDescription,
        description,
        modified,
        isbn,
        upc,
        diamondCode,
        ean,
        issn,
        format,
        pageCount,
        textObjects,
        resourceUri,
        urls,
        series,
        variants,
        collections,
        collectedIssues,
        dates,
        prices,
        thumbnail,
        images,
        creators,
        characters,
        stories,
        events
      ];
}
