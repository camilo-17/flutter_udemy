import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "widget samples app", home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget samples app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                debugPrint("Me apretaste");
              },
              child: const Text("text button"),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
              onPressed: () {},
              child: const Text("Outlined"),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(onPressed: null, child: Text("Elevated"))
          ],
        ),
      ),
    );
  }
}
