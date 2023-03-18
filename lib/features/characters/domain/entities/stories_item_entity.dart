import 'package:equatable/equatable.dart';

class StoriesItem extends Equatable {
  const StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  final String? resourceUri;
  final String? name;
  final String? type;

  @override
  List<Object?> get props => [resourceUri, name, type];
}
