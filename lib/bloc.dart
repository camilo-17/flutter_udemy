import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Bloc App"),
        ),
        body: BlocProvider(
          create: (_) => ColorSettingsBloc(ColorSettings(true)),
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

abstract class ColorSettingsEvent {
  const ColorSettingsEvent();
}

class SetRedColorEvent extends ColorSettingsEvent {
  const SetRedColorEvent();
}

class UnSetRedColorEvent extends ColorSettingsEvent {
  const UnSetRedColorEvent();
}

class ColorSettingsBloc extends Bloc<ColorSettingsEvent, ColorSettings> {
  ColorSettingsBloc(ColorSettings initState) : super(initState) {
    on<SetRedColorEvent>((event, emit) {
      emit(ColorSettings(true));
    });
    on<UnSetRedColorEvent>((event, emit) {
      emit(ColorSettings(false));
    });
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
    return BlocBuilder<ColorSettingsBloc, ColorSettings>(
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
    var colorSettingsBloc = context.read<ColorSettingsBloc>();
    if (isChecked!) {
      colorSettingsBloc.add(const SetRedColorEvent());
    } else {
      colorSettingsBloc.add(const UnSetRedColorEvent());
    }
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorSettingsBloc, ColorSettings>(
        builder: (context, colorSettingsState) {
      return Container(
        color: colorSettingsState.useRed ? Colors.red : Colors.black38,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
      );
    });
  }
}
