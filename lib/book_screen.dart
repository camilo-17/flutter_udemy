import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: const Text("Booksy")),
    body: const ProfileScreen(),
  )));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          const Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image(
                image: AssetImage("images/landscape.jpg"),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Julio Andres"),
                          Text(
                            "Santiago, Chile",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/user.png'),
                      radius: 50,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: const Text(
              "lorem ipsum dolor",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.book,
                    size: 50,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Libros leidos"),
                        Text("numero de libros que ha leido el usuario")
                      ],
                    ),
                  ),
                  Text(
                    "104",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              )),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text("libros que quiero"),
            subtitle: Text("Libros en la lista de deseos."),
            leading: Icon(
              Icons.book,
              size: 50,
            ),
            trailing: Text(
              "358",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          const Text(
            "Redes sociales",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.storage,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  size: 50,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Agregar amigo"),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Enviar mensaje"))
              ],
            ),
          )
        ],
      )
    ]);
  }
}
