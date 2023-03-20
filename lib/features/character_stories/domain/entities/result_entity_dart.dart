import 'package:equatable/equatable.dart';

import 'characters_entity.dart';
import 'creators_entity.dart';
import 'original_issue_entity.dart';

class Result extends Equatable {
  const Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.series,
    this.comics,
    this.events,
    this.originalIssue,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final String? type;
  final String? modified;
  final dynamic thumbnail;
  final Creators? creators;
  final Characters? characters;
  final Characters? series;
  final Characters? comics;
  final Characters? events;
  final OriginalIssue? originalIssue;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        type,
        modified,
        thumbnail,
        creators,
        characters,
        series,
        comics,
        events,
        originalIssue
      ];
}
