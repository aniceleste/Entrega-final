class Auto {
  final int? id;
  final String marca;
  final String nombre;
  final int anio;

  Auto({this.id, required this.marca, required this.nombre, required this.anio});

  Map<String, dynamic> toMap() {
    return {'id': id, 'marca': marca, 'nombre': nombre, 'anio': anio};
  }

  factory Auto.fromMap(Map<String, dynamic> map) {
    return Auto(
      id: map['id'],
      marca: map['marca'],
      nombre: map['nombre'],
      anio: map['anio'],
    );
  }
}
