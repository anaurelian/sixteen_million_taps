// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/common/app_const.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
import 'package:sixteen_million_taps/utils/utils.dart';

class ColorCounterDisplay extends StatelessWidget {
  const ColorCounterDisplay({
    Key? key,
    required this.colorIndex,
    this.onColorLongPress,
  }) : super(key: key);

  final ColorIndex colorIndex;

  final void Function()? onColorLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorIndex.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LinearProgressIndicator(
            value: colorIndex.index / AppConst.maxCount,
            backgroundColor: colorIndex.color,
            color: colorIndex.contrastColor,
            // minHeight: 2.0,
          ),
          Expanded(
            child: Center(
              child: Text(
                Utils.toDecimalString(context, colorIndex.index),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: colorIndex.contrastColor,
                    ),
              ),
            ),
          ),
          GestureDetector(
            onLongPress: onColorLongPress,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
              child: Text(
                colorIndex.colorNameAndHex(),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: colorIndex.contrastColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
