import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mazraamarket/screens/details.dart';

// Définition des constantes de couleurs et autres
const PrimaryColor = Color.fromARGB(255, 229, 226, 231);
const SecondaryColor = Color(0xFFF1E6FF);
const MainColor = Color.fromARGB(255, 244, 115, 29);
const tColor = Color(0xFF424242);

// Définition du modèle d'objet Item
class Item {
  final String name;
  final String image;
  final String price;

  Item({
    required this.name,
    required this.image,
    required this.price,
  });
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        title: const Text(
          'Accueil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: PrimaryColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PROMO!!!",
                          style: TextStyle(
                              letterSpacing: 4,
                              color: MainColor,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Flat 35% OFFER",
                          style: TextStyle(
                              letterSpacing: 4,
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "in honor of World Health Day\nwe had likely to give this \namazing offer",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Color.fromARGB(255, 177, 176, 176),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 160,
                            child: Center(child: Text('View Offers')),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                                color: MainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: SecondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Produits",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  Text(
                    'voir tout',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 20),
              FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('items').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  List<Item> itemList = snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    return Item(
                      name: data['name'],
                      image: data['image'],
                      price: data['price'],
                    );
                  }).toList();
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                    physics: NeverScrollableScrollPhysics(),
                    children: itemList.map((e) => ItemC(context, e)).toList(),
                  );
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: tColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 GestureDetector ItemC(BuildContext context, Item e) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => ItemScreen(e: e),
      ));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 100,
          child: Image.network(
            e.image, // Utilisez l'URL stockée dans l'objet Item
            height: 90,
            width: MediaQuery.of(context).size.width / 2.5,
            fit: BoxFit.cover, // Ajuste l'image pour couvrir la zone spécifiée
          ),
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            color: tColor, // Utiliser la couleur de fond fixe depuis utils.dart
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(300),
              topRight: Radius.circular(300),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mazraa Market',
                style: TextStyle(
                  color: MainColor,
                  letterSpacing: 5,
                  fontSize: 10,
                ),
              ),
              Text(
                e.name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                e.price,
                style: TextStyle(color: Colors.green),
              ),
              // Le reste de votre contenu...
            ],
          ),
          height: 100,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            color: tColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    ),
  );
}

}
