import 'package:equatable/equatable.dart';

import 'series_entity.dart';

class Characters extends Equatable {
  const Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<Series>? items;
  final int? returned;

  @override
  List<Object?> get props => [available, collectionUri, items, returned];
}
