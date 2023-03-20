import 'package:equatable/equatable.dart';

import 'item_entity.dart';

class Creators extends Equatable {
  const Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<Item>? items;
  final int? returned;

  @override
  List<Object?> get props => [available, collectionUri, items, returned];
}
