import 'package:flutter/material.dart';

class GesturesDetectionScreen extends StatefulWidget {
  const GesturesDetectionScreen({Key? key}) : super(key: key);

  @override
  State<GesturesDetectionScreen> createState() => GesturesDetectionState();
}

class GesturesDetectionState extends State<GesturesDetectionScreen> {
  bool _lightIsOn = false; //luz está prendida
  Color _lightColor = Colors.yellow.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detección de gestos'),
      ),
      body: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _lightIsOn = !_lightIsOn;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lightbulb_outline,
                  color: _lightIsOn ? _lightColor : Colors.black,
                  size: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _lightIsOn = !_lightIsOn;
                });
              },
              child: Container(
                color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                // Change button text when light changes state.
                child: const Text('ENCENDER LUZ'),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _lightColor = Colors.red.shade600;
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  padding: const EdgeInsets.all(40),
                  child: const Text('Doble tap me'),
                )),
            const Padding(padding: EdgeInsets.all(8.0)),
            GestureDetector(
                onLongPress: () {
                  setState(() {
                    _lightColor = Colors.yellow.shade600;
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                  padding: const EdgeInsets.all(50),
                  // Change button text when light changes state.
                  child: const Text('Longpress me'),
                )),
          ],
        ),
      ),
    );
  }
}
