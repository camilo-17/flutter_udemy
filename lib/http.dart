import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletons/skeletons.dart';

void main() {
  runApp(const NetworkSampleApp());
}

class NetworkSampleApp extends StatelessWidget {
  const NetworkSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInfoScreen(userId: 'camilo'),
    );
  }
}

class UserInfoScreen extends StatelessWidget {
  final String userId;
  final TextEditingController _controllerUserInfo = TextEditingController();

  UserInfoScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("informacion de usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Datos de usuario"),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              maxLines: 10,
              minLines: 4,
              controller: _controllerUserInfo,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const UserDataWidget(),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    createPost('mi nuevo post', context);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Crear post")),
            ),
          ],
        ),
      ),
    );
  }
}

void createPost(String title, BuildContext context) async {
  var newPost = jsonEncode(<String, String>{
    'title': title,
    'body': "este es un post",
    'userId': '1'
  });
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var postHeaders = {'content-Type': 'application/json; charset=UTF-8'};
  var response = await http.post(url, body: newPost, headers: postHeaders);
  var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  var responseTitle = jsonResponse['title'];
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Creado con exito $responseTitle"),
    backgroundColor: Colors.blue,
  ));
}

class UserDataWidget extends StatefulWidget {
  const UserDataWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserDataState();
  }
}

class UserDataState extends State {
  late Future<User> futerUserData;

  @override
  void initState() {
    super.initState();
    futerUserData = getUserInfo("1");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: futerUserData,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Column(
              children: [
                TextField(
                    controller:
                        TextEditingController(text: snapShot.data!.username),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "username")),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                    controller:
                        TextEditingController(text: snapShot.data!.email),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "email")),
                const Padding(padding: EdgeInsets.only(top: 10)),
                // Center(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         getUserInfo('1');
                //       },
                //       child: const Text("Consultar datos")),
                // ),
              ],
            );
          } else if (snapShot.hasError) {
            return Text("${snapShot.error}");
          } else {
            return SkeletonParagraph(
                style: const SkeletonParagraphStyle(
                    lines: 2, lineStyle: SkeletonLineStyle(height: 40)));
          }
        });
  }

  Future<User> getUserInfo(String userId) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users/$userId");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Future.delayed(const Duration(seconds: 2), () {
        return User.fromJson(jsonDecode(response.body));
      });
      // return User.fromJson(jsonDecode(response.body));

      // _controllerUserInfo.value = TextEditingValue(text: response.body);

      // Map data = json.decode(response.body);
    } else {
      throw Exception("Error al obtener datos del usuario");
    }
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(this.id, this.name, this.username, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['name'], json['username'], json['email']);
  }
}
