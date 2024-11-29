import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_auto_screen.dart';

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
        '/': (context) => HomeScreen(),
        '/addAuto': (context) => AddAutoScreen(),
      },
    );
  }
}
