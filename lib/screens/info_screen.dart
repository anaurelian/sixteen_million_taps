// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sixteen_million_taps/common/app_const.dart';
import 'package:sixteen_million_taps/common/ui_strings.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
import 'package:sixteen_million_taps/utils/color_utils.dart';
import 'package:sixteen_million_taps/utils/utils.dart';

/// A screen that shows information about a named color. Each piece of information can be copied to
/// the clipboard. The user can also perform a web search to get more information.
class InfoScreen extends StatelessWidget {
  const InfoScreen({
    Key? key,
    required this.colorIndex,
  }) : super(key: key);

  /// The color name and code that is displayed in the info screen.
  final ColorIndex colorIndex;

  /// When one of the copy buttons is pressed, copy the associated color value to the Clipboard,
  /// and show a confirmation snackbar.
  Future<void> _onCopyPressed(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    Utils.showSnackBar(context, UIStrings.infoCopied(value));
  }

  /// When the Web info action button is pressed, perform a web search for the color name and code.
  // void _onWebInfoPressed() {
  //   webSearch('${namedColor.name} ${ColorUtils.toHexString(namedColor.color)}');
  // }

  @override
  Widget build(BuildContext context) {
    final Color color = colorIndex.color;

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: colorIndex.color,
        foregroundColor: colorIndex.contrastColor,
        elevation: 0.0,
        title: const Text(UIStrings.infoScreenTitle),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.web),
        //     tooltip: UIStrings.webInfoActionTooltip,
        //     onPressed: _onWebInfoPressed,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: colorIndex.contrastColor),
          child: Table(
            border: TableBorder.all(color: colorIndex.contrastColor.withOpacity(0.25)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(2),
              2: IntrinsicColumnWidth(),
            },
            children: [
              _buildInfo(
                context,
                UIStrings.infoCount,
                Utils.toDecimalString(context, colorIndex.index),
              ),
              _buildInfo(
                context,
                UIStrings.infoRemaining,
                Utils.toDecimalString(context, AppConst.maxCount - colorIndex.index),
              ),
              _buildInfo(
                context,
                UIStrings.infoCompleted,
                Utils.toPercentageString(colorIndex.index, AppConst.maxCount),
              ),
              _buildInfo(context, UIStrings.infoColorName, colorIndex.colorName ?? 'n/a'),
              _buildInfo(context, UIStrings.infoColorHex, ColorUtils.toHexString(color)),
              // _buildInfo(context, UIStrings.infoRGB, ColorUtils.toRGBString(color)),
              // _buildInfo(context, UIStrings.infoHSV, ColorUtils.toHSVString(color)),
              // _buildInfo(context, UIStrings.infoHSL, ColorUtils.toHSLString(color)),
              // _buildInfo(context, UIStrings.infoDecimal, '${color.withAlpha(0).value}'),
              // _buildInfo(
              //   context,
              //   UIStrings.infoLuminance,
              //   color.computeLuminance().toStringAsFixed(5),
              // ),
              // _buildInfo(
              //   context,
              //   UIStrings.infoBrightness,
              //   describeEnum(ThemeData.estimateBrightnessForColor(color)),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a color information table row, with the specified key and value, and a copy button.
  TableRow _buildInfo(BuildContext context, String key, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(key),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(value),
        ),
        TextButton(
          child: const Text(UIStrings.infoCopy),
          style: TextButton.styleFrom(primary: colorIndex.contrastColor),
          onPressed: () => _onCopyPressed(context, value),
        ),
      ],
    );
  }
}
