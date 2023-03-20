import 'package:equatable/equatable.dart';

class Item extends Equatable {
  const Item({
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
