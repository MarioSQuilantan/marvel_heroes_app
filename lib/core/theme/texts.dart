import 'package:flutter/material.dart';

class TextStyles {
  static const h1 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const h4 = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const h5 = TextStyle(fontSize: 8, fontWeight: FontWeight.bold);
  static const h6 = TextStyle(fontSize: 6, fontWeight: FontWeight.bold);
  static final paragraph = _Paragraph();
}

class _Paragraph {
  static const double _fontSize = 12.0;
  final TextStyle bold = const TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold);
  final TextStyle italic = const TextStyle(fontSize: _fontSize, fontStyle: FontStyle.italic);
  final TextStyle normal = const TextStyle(fontSize: _fontSize, fontStyle: FontStyle.normal);
}
