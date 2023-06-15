import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Images")),
      body: const ImagesList(),
    );
  }
}

class ImagesList extends StatelessWidget {
  const ImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
              "https://hips.hearstapps.com/hmg-prod/images/why-pets-make-good-gift-1563986298.jpg",
              loadingBuilder: (context, child, loadingPogress) {
            if (loadingPogress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                  value: loadingPogress.expectedTotalBytes != null
                      ? loadingPogress.cumulativeBytesLoaded /
                          loadingPogress.expectedTotalBytes!
                      : null),
            );
          }),
          const Padding(
            padding: EdgeInsets.all(40),
            child: Image(
              image: AssetImage('images/user.png'),
            ),
          ),
          Image.asset('images/landscape.jpg'),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Image(
            image: NetworkImage(
                "https://hips.hearstapps.com/hmg-prod/images/why-pets-make-good-gift-1563986298.jpg"),
            height: 300,
          ),
        ],
      ),
    );
  }
}
