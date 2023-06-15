import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const MenuScreen(),
    title: "Navigation Example",
    routes: <String, WidgetBuilder>{
      '/perfil_usuario': (context) => const PerfilUsuario(""),
    },
    onGenerateRoute: (settings) {
      if (settings.name!.contains("perfil_usuario")) {
        // /perfil_usuario/:user_id
        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length >= 2) {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => PerfilUsuario(id),
          );
        }
      }
      return null;
    },
  ));
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Abrir pantalla siguiente'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Abrir Perfil Usuario'),
            onPressed: () {
              Navigator.pushNamed(context, '/perfil_usuario/julioandres-1');
            },
          ),
        ]),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Volver!'),
        ),
      ),
    );
  }
}

class PerfilUsuario extends StatelessWidget {
  final String _userId;
  const PerfilUsuario(this._userId, {super.key});

  @override
  Widget build(BuildContext context) {
    //final userId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil Usuario'),
      ),
      body: Column(children: [
        Text('User id: $_userId'),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cerrar!'),
        )
      ]),
    );
  }
}
