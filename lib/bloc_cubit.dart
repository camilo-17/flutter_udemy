import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Bloc App"),
        ),
        body: BlocProvider(
          create: (_) => ColorSettingsCubit(ColorSettings(true)),
          child: const SettingsScreen(),
        )),
    title: "Simple Bloc App",
  ));
}

//state
class ColorSettings {
  bool useRed;
  ColorSettings(this.useRed);
}

//cubit
class ColorSettingsCubit extends Cubit<ColorSettings> {
  ColorSettingsCubit(ColorSettings initialState) : super(initialState);

//siempre hay que crear una nueva instancia, porque si no flutter piensa que es la misma instancia y no va a re dibujar los widgets
  void setRed() {
    emit(ColorSettings(true));
  }

  void unsetRed() {
    emit(ColorSettings(false));
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
    return BlocBuilder<ColorSettingsCubit, ColorSettings>(
        builder: (context, colorSettingsState) {
      return Row(
        children: [
          Checkbox(
            value: colorSettingsState.useRed,
            onChanged: (isChecked) => {onCheckBoxPressed(isChecked, context)},
          ),
          const Text("Rojo")
        ],
      );
    });
  }

  void onCheckBoxPressed(bool? isChecked, BuildContext context) {
    var colorSettingsCubit = context.read<ColorSettingsCubit>();
    if (isChecked!) {
      colorSettingsCubit.setRed();
    } else {
      colorSettingsCubit.unsetRed();
    }
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorSettingsCubit, ColorSettings>(
        builder: (context, colorSettingsState) {
      return Container(
        color: colorSettingsState.useRed ? Colors.red : Colors.black38,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
      );
    });
  }
}
