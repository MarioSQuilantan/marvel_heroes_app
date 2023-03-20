import 'package:equatable/equatable.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/thumbnail_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/url_entity.dart';

import 'comics_entity.dart';
import 'stories_entity.dart';

class Result extends Equatable {
  const Result({
    required this.id,
    required this.name,
    this.description,
    this.modified,
    required this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  final int id;
  final String name;
  final String? description;
  final String? modified;
  final Thumbnail thumbnail;
  final String? resourceUri;
  final Comics? comics;
  final Comics? series;
  final Stories? stories;
  final Comics? events;
  final List<Url>? urls;

  @override
  List<Object?> get props => [id, name, description, modified, thumbnail, resourceUri, comics, series, stories, events, urls];
}
