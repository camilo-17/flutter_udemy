import 'package:course_1/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetSamplesApp());
}

class WidgetSamplesApp extends StatelessWidget {
  const WidgetSamplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget Samples App',
      home: BottomNavigationScreen(),
    );
  }

  //find a image widget.
}
