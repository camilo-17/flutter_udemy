import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Booksy(), title: "Boosky"));
}

class UserData extends InheritedWidget {
  final List<String> booksIds; //["1234", "ABS1212", "DOUG-DSD"];
  const UserData({super.key, required this.booksIds, required Widget child})
      : super(child: child);

  static UserData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>()!;
  }

  @override
  bool updateShouldNotify(covariant UserData oldWidget) {
    //TODO: DEBO ACTUALIZAR A LOS HIJOS PARA QUE SE ACTUALIZEN?
    //fluter da la opcion de decidir si es necesario o no que los hijos se actualizen
    return booksIds != oldWidget.booksIds;
  }
}

class UserDataContainerWidget extends StatefulWidget {
  const UserDataContainerWidget({super.key, required this.child});

  final Widget child;

  @override
  UserDataContainerState createState() {
    return UserDataContainerState();
  }
}

class UserDataContainerState extends State<UserDataContainerWidget> {
  List<String> localBooksId = []; // podría venir del server

  static UserDataContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<UserDataContainerState>()!;
  }

  @override
  Widget build(BuildContext context) {
    return UserData(booksIds: List.from(localBooksId), child: widget.child);
  }

  void addToLibrary(String bookId) {
    setState(() {
      localBooksId.add(bookId);
    });
  }

  void removeToLibrary(String bookId) {
    setState(() {
      localBooksId.remove(bookId);
    });
  }
}

class Booksy extends StatelessWidget {
  const Booksy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Boosky"),
        ),
        body: const UserDataContainerWidget(child: BookScreen()));
  }
}

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        color: Colors.white,
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 30)]),
                  child: const Image(
                    image: AssetImage('images/content.jpeg'),
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),
                const BookDescription(
                    "THE HITCHHIKER'S GUIDE TO THE GALAXY",
                    "ADAMS, DOUGLAS",
                    "The Hitchhiker's Guide to the Galaxy[a][b] is a comedy science fiction franchise created by Douglas Adams. Originally a 1978 radio comedy broadcast on BBC Radio 4, it was later adapted to other formats, including novels, stage shows, comic books, a 1981 TV series, a 1984 text-based computer game, and 2005 feature film. The Hitchhiker's Guide to the Galaxy[a][b] is a comedy science fiction franchise created by Douglas Adams. Originally a 1978 radio comedy broadcast on BBC Radio 4, it was later adapted to other formats, including novels, stage shows, comic books, a 1981 TV series, a 1984 text-based computer game, and 2005 feature film. The Hitchhiker's Guide to the Galaxy[a][b] is a comedy science fiction franchise created by Douglas Adams. Originally a 1978 radio comedy broadcast on BBC Radio 4, it was later adapted to other formats, including novels, stage shows, comic books, a 1981 TV series, a 1984 text-based computer game, and 2005 feature film."),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const AddBookButton('douglas-hitch'),
              ],
            ),
          ),
        )));
  }
}

class BookDescription extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  const BookDescription(this.title, this.author, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          author,
          textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.black54, fontSize: 25),
        ),
        const Padding(padding: EdgeInsets.only(top: 17)),
        Text(
          description,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          style: const TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ],
    );
  }
}

class AddBookButton extends StatelessWidget {
  final String bookId;
  const AddBookButton(this.bookId, {super.key});

  @override
  Widget build(BuildContext context) {
    var userdata = UserData.of(context);
    var isSaved = userdata.booksIds.contains(bookId);
    userdata.booksIds;
    var button = isSaved
        ? ElevatedButton(
            onPressed: () {
              _removeBookInLibrary(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Quitar de la librería"),
          )
        : ElevatedButton(
            onPressed: () {
              _addBookInLibrary(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("Agregar a la librería"),
          );

    return Directionality(textDirection: TextDirection.ltr, child: button);
  }

  void _addBookInLibrary(BuildContext context) {
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.addToLibrary(bookId);
  }

  void _removeBookInLibrary(BuildContext context) {
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.removeToLibrary(bookId);
  }
}
