import 'package:equatable/equatable.dart';

class Url extends Equatable {
  const Url({
    this.type,
    this.url,
  });

  final String? type;
  final String? url;

  @override
  List<Object?> get props => [type, url];
}
