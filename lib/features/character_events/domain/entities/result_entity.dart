import 'package:equatable/equatable.dart';

import 'characters_entity.dart';
import 'creators_entity.dart';
import 'next_entity.dart';
import 'stories_entity.dart';
import 'thumbnail_entity.dart';
import 'url_entity.dart';

class Result extends Equatable {
  const Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.series,
    this.next,
    this.previous,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<Url>? urls;
  final String? modified;
  final DateTime? start;
  final DateTime? end;
  final Thumbnail? thumbnail;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? comics;
  final Characters? series;
  final Next? next;
  final Next? previous;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        urls,
        modified,
        start,
        end,
        thumbnail,
        creators,
        characters,
        stories,
        comics,
        series,
        next,
        previous
      ];
}
