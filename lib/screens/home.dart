import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/models/color_index.dart';
import 'package:sixteen_million_taps/widgets/color_counter_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  late ColorIndex _colorIndex;

  @override
  void initState() {
    _colorIndex = ColorIndex(_index);
    super.initState();
  }

  void incrementIndex() {
    setState(() {
      _index++;
      _colorIndex = ColorIndex(_index);
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
