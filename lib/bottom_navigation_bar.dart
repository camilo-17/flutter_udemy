import 'package:course_1/floating_action_button.dart';
import 'package:course_1/gestures_detectors.dart';
import 'package:course_1/images.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedindex = 0;

  void _onItemTap(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> _screens = [
    const FloatingButtonScreen(),
    const GesturesDetectionScreen(),
    const ImageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("botton navigation bar simple"),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Casa'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Negocio'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'imagenes'),
        ], currentIndex: selectedindex, onTap: _onItemTap),
        body: _screens[selectedindex]);
  }
}
