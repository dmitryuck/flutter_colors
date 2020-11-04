import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  /// Generate random color value
  /// {@tool snippet}
  /// ```dart
  /// Color newColor = Utils.randomizeColor();
  ///
  /// Color newColor2 = Utils.randomizeColor({randomAlpha: true});
  /// ```
  /// Set randomAlpha to true if you want an opacity to be randomized
  /// {@end-tool}
  ///
  static Color randomizeColor({bool randomAlpha = false}) {
    return Color.fromARGB(
      randomAlpha ? Random().nextInt(256) : 255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  /// Check if color more light or dark by luminance
  /// {@tool snippet}
  /// ```dart
  /// bool isColorLight = Utils.isColorLight(Color(0xFFFFFFFF));
  ///
  /// assert(isColorLight);
  ///
  /// ```
  /// {@end-tool}
  ///
  static bool isColorLight(Color color) {
    double luminance =
        sqrt(0.241 * pow(color.red, 2) + 0.691 * pow(color.green, 2) + 0.068 * pow(color.blue, 2));

    if (luminance >= 130) {
      return true;
    }

    return false;
  }
}
