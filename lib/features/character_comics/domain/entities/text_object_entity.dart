import 'package:equatable/equatable.dart';

class TextObject extends Equatable {
  const TextObject({
    this.type,
    this.language,
    this.text,
  });

  final String? type;
  final String? language;
  final String? text;

  @override
  List<Object?> get props => [type, language, text];
}
