import 'dart:math';

import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 1.8}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double value = (width / height) * maxTextScaleFactor;
    return max(1, min(value, maxTextScaleFactor));
  }
}
