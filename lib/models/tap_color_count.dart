// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:sixteen_million_taps/data/named_colors.dart';
import 'package:sixteen_million_taps/utils/color_utils.dart';

class TapColorCount {
  TapColorCount(this.count) {
    color = Color(count).withAlpha(255);
    contrastColor = ColorUtils.contrastColor(color);
    colorName = namedColors[count];
  }

  final int count;
  late final Color color;
  late final Color contrastColor;
  late final String? colorName;

  String colorNameAndHex() => '${colorName ?? ''}\n${ColorUtils.toHexString(color)}';
}
