import 'package:flutter/material.dart';
import 'add_car_screen.dart';
import 'car_detail_screen.dart';
import '../models/car.dart';

class CarsListScreen extends StatefulWidget {
  @override
  _CarsListScreenState createState() => _CarsListScreenState();
}

class _CarsListScreenState extends State<CarsListScreen> {
  // Lista estática de autos
  List<Car> _cars = [
    Car(
      name: 'Ford Mustang',
      description: 'Un muscle car clásico.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7f/1965_Ford_Mustang_2D_Hardtop_Front.jpg',
      brand: 'Ford',
      year: 1965,
    ),
    Car(
      name: 'Chevrolet Camaro',
      description: 'Un coche deportivo de alto rendimiento.',
      imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/2021-chevrolet-camaro-zl1-mmp-1-1604071262.jpg',
      brand: 'Chevrolet',
      year: 2021,
    ),
    Car(
      name: 'BMW M3',
      description: 'Un coche de lujo con gran desempeño.',
      imageUrl: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP1EjYNV39d6zKrEN5MPhilwncbZbRF3BGl41HvtRAUvfqy7oirohcQKdIIS4j51WUoLzUoHIMpFI7IgqEJLvs1-IYI7FxFscPuTVL6WVAOLQD5klppb6B46Y5v11XIka13RAYJ7txJdk/s1600/bmw-serie-2-m2-2018-autoblog-uruguay-precios+%25284%2529.jpg',
      brand: 'BMW',
      year: 2020,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Collection'),
      ),
      body: ListView.builder(
        itemCount: _cars.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Image.network(_cars[index].imageUrl),
            title: Text(_cars[index].name),
            subtitle: Text(_cars[index].brand),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navegar a la pantalla de detalles del auto
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(car: _cars[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar un nuevo auto
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCarScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
