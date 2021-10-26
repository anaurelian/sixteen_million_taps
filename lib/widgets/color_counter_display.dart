import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
import 'package:sixteen_million_taps/utils/color_utils.dart';

class ColorCounterDisplay extends StatelessWidget {
  const ColorCounterDisplay({
    Key? key,
    required this.colorIndex,
  }) : super(key: key);

  final ColorIndex colorIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorIndex.color,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text(
                colorIndex.index.toString(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: colorIndex.contrastColor,
                    ),
              ),
            ),
          ),
          if (colorIndex.colorName != null)
            Text(
              colorIndex.colorName!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: colorIndex.contrastColor,
                  ),
            ),
          Text(
            ColorUtils.toHexString(colorIndex.color),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: colorIndex.contrastColor,
                ),
          ),
        ],
      ),
    );
  }
}
