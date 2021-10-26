// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';

/// Provides color utility functions.
class ColorUtils {
  /// Constructor to prevent instantiation and extension of this class.
  ColorUtils._();

  /// Returns the black or white contrast color of a given color.
  static Color contrastColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

  /// Converts a Color value into a hexadecimal color string.
  static String toHexString(Color color) =>
      '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

}
