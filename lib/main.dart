import 'package:flutter/material.dart';
import 'screens/cars_list_screen.dart';
import 'screens/add_car_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colección de Autos',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => CarsListScreen(),
        '/add': (context) => AddCarScreen(),
      },
    );
  }
}

