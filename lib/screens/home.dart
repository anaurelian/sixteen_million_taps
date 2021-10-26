import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/common/app_settings.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
import 'package:sixteen_million_taps/widgets/color_counter_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _index = 0;
  // late ColorIndex _colorIndex;
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

  void incrementIndex() {
    setState(() {
      _appSettings.index.value++;
      _colorIndex = ColorIndex(_appSettings.index.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorIndex.color,
        elevation: 0.0,
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
