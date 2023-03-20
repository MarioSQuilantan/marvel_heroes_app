import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  const Thumbnail({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  @override
  List<Object?> get props => [path, extension];
}
