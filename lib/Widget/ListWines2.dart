import 'package:flutter/material.dart';

class Wine {
  final String name;    // Numele vinului
  final String type;    // Tipul vinului
  final String country; // Țara de origine
  final String photo;   // URL-ul sau calea către imaginea vinului
  final bool available; // Disponibilitate
  final double price;   // Prețul
  final int stock;      // Stocul
  final int criticScore; // Scorul criticilor

  Wine({
    required this.name,
    required this.type,
    required this.country,
    required this.photo,
    required this.available,
    required this.price,
    required this.stock,
    required this.criticScore,
  });
}

class VerticalWineList extends StatefulWidget {
  @override
  State<VerticalWineList> createState() => _VerticalWineListState();
}

class _VerticalWineListState extends State<VerticalWineList> {



  final List<Wine> wines = [
    Wine(
        name: 'Ocone Bozzovich Beneventano Bianco IGT',
        type: 'Red wine',
        country: 'France',
        photo: 'img/Rectangle 9.png',
        available: true,
        price: 23256596,
        stock: 123,
        criticScore: 94),
    Wine(
        name: '2021 Petit Chablis - Passy Le Clou',
        type: 'White wine',
        country: 'France',
        photo: 'img/Rectangle 9 (1).png',
        available: true,
        price: 23256596,
        stock: 123,
        criticScore: 94),
    Wine(
        name: 'Philippe Fontaine Champagne Brut Rosé',
        type: 'Sparkling wine',
        country: 'France',
        photo: 'img/Rectangle 9 (2).png',
        available: false,
        price: 23256596,
        stock: 0,
        criticScore: 94),
    Wine(
        name: '2021 Cicada’s Song Rosé',
        type: 'Rose wine',
        country: 'France',
        photo: 'img/Rectangle 9 (3).png',
        available: true,
        price: 23256596,
        stock: 123,
        criticScore: 94),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Înălțimea fiecărui card
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Orizontală
        itemCount: wines.length,
        itemBuilder: (context, index) {
          final wine = wines[index];
          return
            Container(
              padding: EdgeInsets.only(top:20,left: 5,right: 5),
           child: Container(
              width: 350, // Adjust width as needed
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image on the left side
                  Container(
                    width: 100, // Adjust image width as needed
                    height: 150, // Adjust image height as needed
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(wine.photo), // Aici wine.photo trebuie să fie calea către fișierul din assets


                    ),
                  ),
                  SizedBox(width: 16), // Space between image and text
                  // Text content on the right side
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(20) ,
                            color: !wine.available? Colors.red[100] : Colors.green[100]
                          ),
                          child: Text(!wine.available?"Unavaliable" :"Available",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:!wine.available? Colors.red : Colors.green),),
                        ),
                        Text(
                          wine.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.wine_bar, color: Colors.redAccent),
                            SizedBox(width: 8),
                            Text(
                              'Red wine (Green and Flinty)',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.flag, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              'From Champagne Blanc...',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          '₹ 23,256,596',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Bottle (750ml)',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.favorite_border, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              'Critics\' Scores: 94 / 100',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ),
            );
        },
      ),
    );
  }
}
