class Car {
  int? id;
  String name;
  String description;
  String imageUrl;  // URL de la imagen
  String brand;
  int year;

  Car({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.brand,
    required this.year,
  });

  // Convertir de un mapa (Base de datos)
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      brand: map['brand'],
      year: map['year'],
    );
  }

  // Convertir a mapa (para SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'brand': brand,
      'year': year,
    };
  }
}
