// Copyright 2014-2021 anaurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/common/app_const.dart';
import 'package:sixteen_million_taps/common/app_settings.dart';
import 'package:sixteen_million_taps/common/ui_strings.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
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
  ColorIndex _colorIndex = ColorIndex(0);

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
    _colorIndex = ColorIndex(_appSettings.index.value);
    setState(() {}); // Refresh after loading settings.
  }

  void updateIndex(int newValue) {
    if (newValue > AppConst.maxCount) {
      // TODO: Show a Congratulations Splash Screen
      Utils.showSnackBar(context, "Congratulations! Done.");
      return;
    }

    if (newValue >= 0) {
      setState(() {
        _appSettings.index.value = newValue;
        _colorIndex = ColorIndex(_appSettings.index.value);
      });
    }
  }

  void incrementIndex() {
    updateIndex(_appSettings.index.value + 1);
  }

  /// Perform the actions of the app bar.
  void _onAppBarAction(HomeAppBarActions action) {
    switch (action) {
      // Go back to the previous index
      case HomeAppBarActions.back:
        updateIndex(_appSettings.index.value - 1);
        // updateIndex(0xFFFF00);
        break;
      // Navigate to the Info Screen.
      case HomeAppBarActions.info:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoScreen(colorIndex: _colorIndex)),
        );
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
        backgroundColor: _colorIndex.color,
        foregroundColor: _colorIndex.contrastColor,
        onAction: _onAppBarAction,
      ),
      body: GestureDetector(
        onTap: incrementIndex,
        child: ColorCounterDisplay(
          colorIndex: _colorIndex,
        ),
      ),
    );
  }
}
