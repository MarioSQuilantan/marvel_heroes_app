import 'package:equatable/equatable.dart';

import 'original_issue_entity.dart';

class Characters extends Equatable {
  const Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<OriginalIssue>? items;
  final int? returned;

  @override
  List<Object?> get props => [available, collectionUri, items, returned];
}
