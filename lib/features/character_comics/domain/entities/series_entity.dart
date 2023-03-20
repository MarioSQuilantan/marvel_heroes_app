import 'package:equatable/equatable.dart';

class Series extends Equatable {
  const Series({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => [resourceUri, name];
}
