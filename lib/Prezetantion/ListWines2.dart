import 'package:flutter/material.dart';
import '../Data/Wines.dart';
import '../Domain/Controller.dart'; // Importă modelul Wine


class VerticalWineList extends StatefulWidget {
  @override
  State<VerticalWineList> createState() => _VerticalWineListState();
}

class _VerticalWineListState extends State<VerticalWineList> {
  List<Wine> wines = []; // Lista inițializată ca goală

  @override
  void initState() {
    super.initState();
    loadWines(); // Încărcați vinurile când widget-ul se inițializează
  }

  Future<void> loadWines() async {
    final loadedWines = await WineLoader.loadWines(); // Folosim WineLoader pentru a încărca vinurile
    setState(() {
      wines = loadedWines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Înălțimea fiecărui card
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Vertical
        itemCount: wines.length,
        itemBuilder: (context, index) {
          final wine = wines[index];
          return Container(
            padding: EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Container(
              width: 350,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        wine.photo,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: !wine.available ? Colors.red[100] : Colors.green[100],
                          ),
                          child: Text(
                            !wine.available ? "Unavailable" : "Available",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: !wine.available ? Colors.red : Colors.green),
                          ),
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
                          '₹ ${wine.price.toStringAsFixed(2)}',
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
                              'Critics\' Scores: ${wine.criticScore} / 100',
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
