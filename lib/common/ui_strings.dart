// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// Application wide UI and URL string constants.
class UIStrings {
  // Constructor to prevent instantiation and extension of this class.
  UIStrings._();

  static const String appName = 'Hello World Counters';

  // -----------------------------------------------------------------------------------------------
  // Home Screen
  // -----------------------------------------------------------------------------------------------

  static const String backActionTooltip = 'Back to previous';
  static const String infoAction = 'Info';
  static const String rateAction = 'Rate app';
  static const String rateActionUrl =
      'https://play.google.com/store/apps/details?id=com.tecdrop.milliontaps';
  static const String whatAction = 'What is this app?';
  static const String whatActionUrl = 'https://anaurelian.com/16milliontaps/';

  // -----------------------------------------------------------------------------------------------
  // Info Screen
  // -----------------------------------------------------------------------------------------------

  static const String infoScreenTitle = 'Info';

  static const String infoCount = 'Count';
  static const String infoRemaining = 'Remaining';
  static const String infoCompleted = 'Completed';
  static const String infoColorName = 'Color name';
  static const String infoColorHex = 'Hex triplet';
  static const String infoColorRGB = 'RGB';
  static const String infoAppUsage = 'App usage';

  static const String infoCopy = 'copy';

  static String infoCopied(String value) => '$value copied to clipboard';
}
