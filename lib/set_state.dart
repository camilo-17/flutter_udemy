import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Simple State"),
      ),
      body: const SettingsScreen(),
    ),
    title: "Simple State App",
  ));
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ColorsSelection(
        isChecked: isChecked,
        onPressed: checkBoxPressed,
      ),
      ColoredBox(isChecked),
    ]);
  }

  void checkBoxPressed(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }
}

class ColorsSelection extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onPressed;
  const ColorsSelection(
      {Key? key, required this.isChecked, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onPressed,
        ),
        const Text("Rojo")
      ],
    );
  }
}

class ColoredBox extends StatelessWidget {
  final bool showColor;

  const ColoredBox(this.showColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showColor ? Colors.red : Colors.black38,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
    );
  }
}
