// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/common/ui_strings.dart';

/// The actions available in the app bar.
enum HomeAppBarActions { info, back, rate, what }

/// The app bar of the Home Screen.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.onAction,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? foregroundColor;

  /// The callback that is called when an app bar action is pressed.
  final Function(HomeAppBarActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: const Icon(Icons.undo),
          tooltip: UIStrings.backActionTooltip,
          onPressed: () => onAction(HomeAppBarActions.back),
        ),
        PopupMenuButton<HomeAppBarActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<HomeAppBarActions>>[
            const PopupMenuItem<HomeAppBarActions>(
              value: HomeAppBarActions.info,
              child: Text(UIStrings.infoAction),
            ),
            const PopupMenuItem<HomeAppBarActions>(
              value: HomeAppBarActions.rate,
              child: Text(UIStrings.rateAction),
            ),
            const PopupMenuItem<HomeAppBarActions>(
              value: HomeAppBarActions.what,
              child: Text(UIStrings.whatAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
