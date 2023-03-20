import 'package:equatable/equatable.dart';

class Next extends Equatable {
  const Next({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => [resourceUri, name];
}
