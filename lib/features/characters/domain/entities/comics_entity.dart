import 'package:equatable/equatable.dart';

import 'comics_item_entity.dart';

class Comics extends Equatable {
  const Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<ComicsItem>? items;
  final int? returned;

  @override
  List<Object?> get props => [available, collectionUri, items, returned];
}
