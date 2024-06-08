import 'package:flutter/material.dart';



Color MainColor = Color.fromARGB(255, 235, 137, 39);
Color PrimaryColor = Color.fromARGB(255, 246, 244, 244);
Color SecondaryColor = Color.fromARGB(255, 238, 234, 234);
Color tColor = Color.fromARGB(255, 242, 241, 241);
Color iconBack = Color.fromARGB(255, 237, 235, 235);


class Iconss {
  String image;
  String head;
  Iconss({required this.image, required this.head});
}

List iconsList = [
  Iconss(image: 'assets/icons/LikeOutline.svg', head: 'Quality\nAssurance'),
  Iconss(image: 'assets/icons/StartOutline.svg', head: 'Highly\nRated'),
  Iconss(image: 'assets/icons/SpoonOutline.svg', head: 'Best In\nTaste'),
];


class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        width: 270,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 154, 105),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "S'identifier",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}

class MyyButton extends StatelessWidget {
  final Function()? onTap;

  const MyyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        width: 270,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 154, 105),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "Se connecter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}