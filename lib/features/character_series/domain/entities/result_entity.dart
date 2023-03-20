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
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<Url>? urls;
  final int? startYear;
  final int? endYear;
  final String? rating;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? comics;
  final Characters? events;
  final Next? next;
  final Next? previous;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        urls,
        startYear,
        endYear,
        rating,
        type,
        modified,
        thumbnail,
        creators,
        characters,
        stories,
        comics,
        events,
        next,
        previous
      ];
}
