
import 'dart:ui';

import 'package:sixteen_million_taps/data/named_colors.dart';
import 'package:sixteen_million_taps/utils/color_utils.dart';

class ColorIndex {
  ColorIndex(this.index) {
    color = Color(index).withAlpha(255);
    contrastColor = ColorUtils.contrastColor(color);
    colorName = namedColors[index];
  }

  final int index;
  late final Color color;
  late final Color contrastColor;
  late final String? colorName;

  String colorNameAndHex() => '${colorName ?? ''}\n${ColorUtils.toHexString(color)}';
}