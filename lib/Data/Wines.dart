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

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      type: json['type'],
      country: json['country'],
      photo: json['photo'],
      available: json['available'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      criticScore: json['criticScore'],
    );
  }
}