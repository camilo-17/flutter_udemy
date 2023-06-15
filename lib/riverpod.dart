import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Simple Riverpod App"),
          ),
          body: const SettingsScreen(),
        ),
        title: "Simple Riverpod App",
      ),
    ),
  );
}

// Este es el state (estado)
class ColorSettings {
  final bool useRed;
  const ColorSettings(this.useRed);
}

// StateNotifier -> todo lo que cambie aca se va a notificar al watch
class ColorSettingsNotifier extends StateNotifier<ColorSettings> {
  ColorSettingsNotifier(ColorSettings state) : super(state);

  void setRed() {
    // state.useRed = true; no funciona, debemos sobreescribir todo el state
    state = const ColorSettings(true);
  }

  void unsetRed() {
    state = const ColorSettings(false);
  }
}

// StateNotifierProvider
final colorSettingsProvider =
    StateNotifierProvider<ColorSettingsNotifier, ColorSettings>(
        (_) => ColorSettingsNotifier(const ColorSettings(true)));

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

class ColorsSelection extends ConsumerWidget {
  const ColorsSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorSettings = ref.watch(colorSettingsProvider);
    return Row(
      children: [
        Checkbox(
          value: colorSettings.useRed,
          onChanged: (isChecked) =>
              {onCheckBoxPressed(isChecked, ref, context)},
        ),
        const Text("Rojo")
      ],
    );
  }

  void onCheckBoxPressed(bool? isChecked, WidgetRef ref, BuildContext context) {
    var colorSettingsNotifier = ref.read(colorSettingsProvider.notifier);
    if (isChecked!) {
      colorSettingsNotifier.setRed();
    } else {
      colorSettingsNotifier.unsetRed();
    }
  }
}

// consumer widget
class ColoredBox extends ConsumerWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorSettings = ref.watch(colorSettingsProvider);

    return Container(
      color: colorSettings.useRed ? Colors.red : Colors.black38,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
    );
  }
}
