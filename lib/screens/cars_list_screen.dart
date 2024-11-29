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
      name: 'Opala',
      description: 'Un coche de lujo de la epoca en Brasil.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Chevrolet_Opala_Comodoro_1978.jpg/640px-Chevrolet_Opala_Comodoro_1978.jpg',
      brand: 'Chevrolet',
      year: 1965,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
    );
  }
}
