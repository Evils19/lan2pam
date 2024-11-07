import 'package:flutter/material.dart';

import '../Data/Wines2.dart';



class HorizontalWineList extends StatelessWidget {
  final List<Wine2> wines = [
    Wine2(type: 'Red wines', photo: 'img/img_1.png', stock: 123),
    Wine2(type: 'White wines', photo: 'img/img.png', stock: 123),
    Wine2(type: 'Red wines', photo: 'img/img_1.png', stock: 123),
    Wine2(type: 'White wines', photo: 'img/img.png', stock: 123),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Înălțimea fiecărui card
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Orizontală
        itemCount: wines.length,
        itemBuilder: (context, index) {
          final wine = wines[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                width: 150, // Lățimea fiecărui card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(wine.photo, height: 135,width: 150, fit: BoxFit.cover),
                        Positioned(
                          top: 0,
                          right: -5,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${wine.stock}', // Stocul
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        wine.type, // Tipul vinului
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


