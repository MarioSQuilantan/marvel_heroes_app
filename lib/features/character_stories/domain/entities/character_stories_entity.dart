import 'package:equatable/equatable.dart';

import 'data_entity.dart';

class CharacterStories extends Equatable {
  const CharacterStories({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  @override
  List<Object?> get props => [code, status, copyright, attributionText, attributionHtml, etag, data];
}
