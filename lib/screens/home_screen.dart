// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/common/app_const.dart';
import 'package:sixteen_million_taps/common/app_settings.dart';
import 'package:sixteen_million_taps/common/ui_strings.dart';
import 'package:sixteen_million_taps/models/tap_color_count.dart';
import 'package:sixteen_million_taps/screens/info_screen.dart';
import 'package:sixteen_million_taps/utils/utils.dart';
import 'package:sixteen_million_taps/widgets/color_counter_display.dart';
import 'package:sixteen_million_taps/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TapColorCount _tapColorCount = TapColorCount(0);

  /// The current app settings.
  final AppSettings _appSettings = AppSettings();

  @override
  void initState() {
    _loadSettings();
    super.initState();
  }

  /// Load and apply settings
  Future<void> _loadSettings() async {
    await _appSettings.load();
    _tapColorCount = TapColorCount(_appSettings.tapCount.value);
    setState(() {}); // Refresh after loading settings.
  }

  void _updateCount(int newValue) {
    if (newValue > AppConst.maxCount) {
      // TODO: Show a Congratulations Splash Screen
      Utils.showSnackBar(context, "Congratulations! Done.");
      return;
    }

    // TODO: Stop writing to SharedPreferences for each increment?
    if (newValue >= 0) {
      setState(() {
        _appSettings.tapCount.value = newValue;
        _tapColorCount = TapColorCount(_appSettings.tapCount.value);
      });
    }
  }

  void _incrementCount() {
    _updateCount(_appSettings.tapCount.value + 1);
  }

  void _openInfoScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoScreen(tapColorCount: _tapColorCount)),
    );
  }

  /// Perform the actions of the app bar.
  void _onAppBarAction(HomeAppBarActions action) {
    switch (action) {
      // Decrease tap count
      case HomeAppBarActions.back:
        _updateCount(_appSettings.tapCount.value - 1);
        break;
      // Navigate to the Info Screen.
      case HomeAppBarActions.info:
        _openInfoScreen();
        break;
      // Open the Google Play app page to allow the user to rate the app.
      case HomeAppBarActions.rate:
        Utils.launchUrl(context, UIStrings.rateActionUrl);
        break;
      // Open the app home page in the default browser.
      case HomeAppBarActions.what:
        Utils.launchUrl(context, UIStrings.whatActionUrl);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        backgroundColor: _tapColorCount.color,
        foregroundColor: _tapColorCount.contrastColor,
        onAction: _onAppBarAction,
      ),
      body: GestureDetector(
        onTap: _incrementCount,
        child: ColorCounterDisplay(
          tapColorCount: _tapColorCount,
          onColorLongPress: _openInfoScreen,
        ),
      ),
    );
  }
}
