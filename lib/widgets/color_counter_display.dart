import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/models/color_index.dart';

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
          Text(
            colorIndex.colorNameAndHex(),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: colorIndex.contrastColor,
                ),
          ),
        ],
      ),
    );
  }
}
