import 'package:equatable/equatable.dart';

import 'next_entity.dart';

class Characters extends Equatable {
  const Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<Next>? items;
  final int? returned;

  @override
  List<Object?> get props => [available, collectionUri, items, returned];
}
