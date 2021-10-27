// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Provides various utility functions.
class Utils {
  /// Constructor to prevent instantiation and extension of this class.
  Utils._();

  /// Formats [number] as a decimal, inserting locale-appropriate thousands separators as necessary.
  static String toDecimalString(BuildContext context, int number) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return localizations.formatDecimal(number);
  }

  static String toPercentageString(int actual, int available) {
    return ((actual / available) * 100).toStringAsFixed(3) + '%';
  }

  /// Shows a default [SnackBar] with the specified text, after hiding any previous snackbars.
  static void showSnackBar(BuildContext context, String text) {
    final SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Launches the specified [URL] in the mobile platform.
  ///
  /// Shows an error [SnackBar] if there is no support for launching the URL.
  static Future<void> launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showSnackBar(context, 'Failed to open $url');
    }
  }
}
