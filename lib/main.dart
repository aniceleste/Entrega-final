import 'package:flutter/material.dart';
import 'screens/cars_list_screen.dart';
import 'screens/add_car_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // El índice de la pestaña seleccionada

  // Las pantallas que se mostrarán según el índice seleccionado
  static List<Widget> _widgetOptions = <Widget>[
    CarsListScreen(), 
    AddCarScreen(),  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambiar de pantalla según el índice
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colección de Autos',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Colección de Autos'),
        ),
        body: _widgetOptions.elementAt(_selectedIndex), 
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, 
          onTap: _onItemTapped, 
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Agregar',
            ),
          ],
        ),
      ),
    );
  }
}
