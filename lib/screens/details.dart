import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mazraamarket/authentification/signin.dart';

import 'package:mazraamarket/constant/utils.dart';
import 'package:mazraamarket/screens/accueil.dart';

const PrimaryColor = Color.fromARGB(255, 229, 226, 231);
const SecondaryColor = Color(0xFFF1E6FF);
const MainColor = Color.fromARGB(255, 244, 115, 29);
const tColor = Color(0xFF424242);


class ItemScreen extends StatelessWidget {
  final Item e;
  const ItemScreen({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 60,
        
        toolbarHeight: 60,
        
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Mazraa Market',
                style: TextStyle(
                    fontSize: 20, color: MainColor, letterSpacing: 10)),
            SizedBox(
              height: 10,
            ),
            Text(e.name,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
            SizedBox(
              height: 10,
            ),
           
            SizedBox(
              height: 150,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(10, -40),
                        child: Transform.scale(
                          scale: 2.6,
                           child: Image.network(
            e.image, // Utilisez l'URL stockée dans l'objet Item
            height: 90,
            width: MediaQuery.of(context).size.width / 2.5,
            // Ajuste l'image pour couvrir la zone spécifiée
          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  '${e.name}',
                                  style: TextStyle(
                                      color: SecondaryColor.withOpacity(0.6),
                                      fontSize: 30),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${e.price}',
                                  style: TextStyle(
                                      color: MainColor.withOpacity(0.6),
                                      fontSize: 25),
                                ),
                              ),
                             
                            
                            ],
                          ),
                         
                        ],
                      ),
                   
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FirstGD(),
                          GestureDetector(
                              onTap: () {
                                  Navigator.push(
                        context,
                        MaterialPageRoute(
                             builder: (context) =>LoginScreen(
                              
                             )),
                        );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height: 40,
                                child: Row(
                                  children: [
                                    Text(
                                      'Go To Cart',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 6, 2, 67),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrowRight.svg',
                                      width: 20,
                                      height: 20,
                                      color: Color.fromARGB(255, 6, 2, 67),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: MainColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: tColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 2.7),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 2.7),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }

  GestureDetector FirstGD() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/minus-solid.svg',
                width: 10,
                height: 10,
                color: Color.fromARGB(255, 157, 157, 157),
              ),
            ),
            Text(
              "1",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              iconSize: 14,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/plus-solid.svg',
                width: 10,
                height: 10,
                color: Color.fromARGB(255, 157, 157, 157),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: iconBack,
            borderRadius: BorderRadius.all(Radius.circular(13))),
      ),
    );
  }
}
