import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("listas con listview"),
      ),
      body: ListViewTappleBle(),
    );
  }
}

class ListViewWidgets extends StatelessWidget {
  const ListViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila 1 "),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila 2 "),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila 3 "),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila 4 "),
          ),
        ),
      ],
    );
  }
}

class ListViewWithBuilder extends StatelessWidget {
  final List<String> rows = <String>['A', 'B', 'C', 'D'];
  final List<int> colorsCode = <int>[600, 500, 100, 900];

  ListViewWithBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: rows.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.green[colorsCode[index]],
            child: Center(
              child: Text("fila ${rows[index]}"),
            ),
          );
        });
  }
}

class ListViewTappleBle extends StatelessWidget {
  final List<String> rows = <String>['A', 'B', 'C', 'D'];
  final List<int> colorsCode = <int>[600, 500, 100, 900];

  ListViewTappleBle({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: rows.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("motrando ${rows[index]}")))
            },
            splashColor: Colors.blue,
            child: ListTile(
              title: Center(
                child: Text("fila ${rows[index]}"),
              ),
            ),
          );
        });
  }
}

class ListViewWithSeparared extends StatelessWidget {
  final List<String> rows = <String>['A', 'B', 'C', 'D'];
  final List<int> colorsCode = <int>[600, 500, 100, 900];

  ListViewWithSeparared({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: rows.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: Colors.green[colorsCode[index]],
          child: Center(
            child: Text("fila ${rows[index]}"),
          ),
        );
      },
      separatorBuilder: (context, index) {
        var hei = 10.0;
        if (index == 2) {
          hei = 30;
        }
        return Divider(
          height: hei,
        );
      },
    );
  }
}
