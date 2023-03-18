import 'package:equatable/equatable.dart';

class ComicsItem extends Equatable {
  const ComicsItem({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => [resourceUri, name];
}
