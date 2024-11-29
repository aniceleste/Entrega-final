class Car {
  final int? id;
  final String name;
  final String brand;
  final int year;
  final String imageUrl;
  final String description;

  Car({
    this.id,
    required this.name,
    required this.brand,
    required this.year,
    required this.imageUrl,
    required this.description,
  });

  // Convertir un objeto Car a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'year': year,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  // Crear un objeto Car desde un Map de la base de datos
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      name: map['name'],
      brand: map['brand'],
      year: map['year'],
      imageUrl: map['imageUrl'],
      description: map['description'],
    );
  }
}
