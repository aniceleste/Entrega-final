import 'package:flutter/material.dart';
import 'screens/cars_list_screen.dart';
import 'screens/add_car_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  int _selectedIndex = 0; 

  // Lista de pantallas 
  static List<Widget> _widgetOptions = <Widget>[
    CarsListScreen(),  
    AddCarScreen(),
     AboutScreen(),    
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colección de Autos',
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false, // Elimina la barra de depuración
      home: Scaffold(
        appBar: AppBar(
          title: Text('Colección de Autos'),
          backgroundColor: Colors.indigo[100],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),  
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,  
          backgroundColor: Colors.indigo[100],
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
            BottomNavigationBarItem(  
              icon: Icon(Icons.info),
              label: 'Acerca de',
            ),
          ],
          selectedItemColor: Colors.deepPurple,  
          unselectedItemColor: Colors.deepPurpleAccent, 
        ),
      ),
    );
  }
}
