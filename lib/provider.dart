import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Simple State"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ColorSettings(),
        child: const SettingsScreen(),
      ),
    ),
    title: "Simple State App",
  ));
}

class ColorSettings extends ChangeNotifier {
  bool useRed = false;
  void setRed() {
    useRed = true;
    notifyListeners();
  }

  void unSetRed() {
    useRed = false;
    notifyListeners();
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ColorsSelection(),
      ColoredBox(),
    ]);
  }
}

class ColorsSelection extends StatelessWidget {
  const ColorsSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Row(
        children: [
          Checkbox(
            value: colorSettings.useRed,
            onChanged: (value) => {onCheckBoxPressed(value, colorSettings)},
          ),
          const Text("Rojo")
        ],
      );
    });
  }

  void onCheckBoxPressed(bool? value, ColorSettings colorSettings) {
    // si solo se quiere el dato pero no queremos escuchar los cambios
    // var colorSettings = Provider.of<ColorSettings>(context, listen: false);
    if (value!) {
      colorSettings.setRed();
    } else {
      colorSettings.unSetRed();
    }
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Container(
        color: colorSettings.useRed ? Colors.red : Colors.black45,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
      );
    });
  }
}
