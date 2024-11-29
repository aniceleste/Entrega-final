import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/auto.dart';

class AddAutoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Auto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(labelText: 'Marca'),
                validator: (value) => value == null || value.isEmpty ? 'Ingrese la marca' : null,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) => value == null || value.isEmpty ? 'Ingrese el nombre' : null,
              ),
              TextFormField(
                controller: _anioController,
                decoration: InputDecoration(labelText: 'Año'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Ingrese el año' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final auto = Auto(
                      marca: _marcaController.text,
                      nombre: _nombreController.text,
                      anio: int.parse(_anioController.text),
                    );
                    await DBHelper().insertAuto(auto);
                    Navigator.pop(context);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
