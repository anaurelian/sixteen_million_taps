import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/screens/home_screen.dart';

import 'common/ui_strings.dart';

void main() {
  runApp(const SixteenMillionTapsApp());
}

class SixteenMillionTapsApp extends StatelessWidget {
  const SixteenMillionTapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UIStrings.appName,
      home: HomeScreen(),
    );
  }
}
