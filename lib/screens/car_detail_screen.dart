import 'package:flutter/material.dart';
import 'package:proyecto_final/models/car.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car; // Recibimos un objeto de tipo Car

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del auto
            Image.network(
              car.imageUrl,
              fit: BoxFit.contain, // Ajuste sin recortar la imagen
              height: 250, // Establece una altura máxima
              width: double.infinity, // La imagen ocupará el ancho completo
            ),
            SizedBox(height: 16.0),
            // Información del auto: Marca
            Text(
              'Marca: ${car.brand}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            // Año del auto
            Text(
              'Year: ${car.year}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            // Título para la descripción
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            // Descripción del auto
            Text(
              car.description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
