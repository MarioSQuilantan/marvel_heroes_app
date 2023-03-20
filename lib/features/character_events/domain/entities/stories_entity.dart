import 'package:equatable/equatable.dart';

import 'stories_item.entity.dart';

class Stories extends Equatable {
  const Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<StoriesItem>? items;
  final int? returned;

  @override
  List<Object?> get props => [
        available,
        collectionUri,
        items,
        returned,
      ];
}
