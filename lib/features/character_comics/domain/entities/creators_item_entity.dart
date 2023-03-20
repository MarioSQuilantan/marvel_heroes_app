import 'package:equatable/equatable.dart';

class CreatorsItem extends Equatable {
  const CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  final String? resourceUri;
  final String? name;
  final String? role;

  @override
  List<Object?> get props => [resourceUri, name, role];
}
