import 'package:flutter/material.dart';

class FloatingButtonScreen extends StatelessWidget {
  const FloatingButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button'),
      ),
      //floatingActionButton: const ExtendedFloatingButton(),
      floatingActionButton: const StandardFloatingButton(),
    );
  }
}

class ExtendedFloatingButton extends StatelessWidget {
  const ExtendedFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text('Nuevo'),
      icon: const Icon(Icons.plus_one_outlined),
      backgroundColor: Colors.pink,
    );
  }
}

class StandardFloatingButton extends StatelessWidget {
  const StandardFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Botón apretado!",
            ),
          ),
        );
      },
      backgroundColor: Colors.pink,
      child: const Icon(Icons.navigation),
    );
  }
}
