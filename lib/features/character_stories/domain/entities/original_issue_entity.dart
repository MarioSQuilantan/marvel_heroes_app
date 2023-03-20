import 'package:equatable/equatable.dart';

class OriginalIssue extends Equatable {
  const OriginalIssue({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => [resourceUri, name];
}
