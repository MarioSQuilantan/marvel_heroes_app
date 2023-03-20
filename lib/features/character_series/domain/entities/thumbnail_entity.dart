import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  const Thumbnail({
    this.path,
    this.extension,
  });

  final String? path;
  final String? extension;

  @override
  List<Object?> get props => [path, extension];
}
