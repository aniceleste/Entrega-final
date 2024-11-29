import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/car.dart';

class AddCarScreen extends StatefulWidget {
  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _brandController = TextEditingController();
  final _yearController = TextEditingController();

  final DBHelper _dbHelper = DBHelper();

  void _addCar() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final imageUrl = _imageUrlController.text;
    final marca = _brandController.text;
    final year = int.tryParse(_yearController.text) ?? 2024;

    if (name.isEmpty || description.isEmpty || imageUrl.isEmpty) {
      // Si faltan datos, muestra un error.
      return;
    }

    final newCar = Car(
      name: name,
      description: description,
      imageUrl: imageUrl,
      brand: marca,
      year: year,
    );

    await _dbHelper.insertCar(newCar);
    Navigator.pop(context);  // Regresar a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Car Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _brandController,
              decoration: InputDecoration(labelText: 'Brand'),
            ),
            TextField(
              controller: _yearController,
              decoration: InputDecoration(labelText: 'Year'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCar,
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}

