import 'package:flutter/material.dart';
import 'package:sixteen_million_taps/screens/home.dart';

import 'common/app_strings.dart';

void main() {
  runApp(const SixteenMillionTapsApp());
}

class SixteenMillionTapsApp extends StatelessWidget {
  const SixteenMillionTapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: HomeScreen(),
    );
  }
}
