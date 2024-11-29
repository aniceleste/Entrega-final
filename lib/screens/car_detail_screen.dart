import 'package:flutter/material.dart';
import 'package:proyecto_final/models/car.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car; 

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
        backgroundColor: Colors.deepPurple, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del auto
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    car.imageUrl,
                    fit: BoxFit.cover, 
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              
              Text(
                'Marca: ${car.brand}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              // Año del auto
              Text(
                'Año: ${car.year}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              // Título para la descripción
              Text(
                'Descripción:',
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
      ),
    );
  }
}
