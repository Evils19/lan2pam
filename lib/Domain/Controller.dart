import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import '../Data/Wines.dart'; // Importă modelul Wine

class WineLoader {
  // Metoda statică pentru a încărca vinurile
  static Future<List<Wine>> loadWines() async {
    final String response = await rootBundle.rootBundle.loadString('Data/wines.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Wine.fromJson(json)).toList();
  }
}
