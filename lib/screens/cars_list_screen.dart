import 'package:flutter/material.dart';
import 'package:proyecto_final/models/car.dart';
import 'package:proyecto_final/screens/car_detail_screen.dart';
import 'package:proyecto_final/db/db_helper.dart';

class CarsListScreen extends StatefulWidget {
  @override
  _CarsListScreenState createState() => _CarsListScreenState();
}

class _CarsListScreenState extends State<CarsListScreen> {
  List<Car> cars = [];
  List<Car> filteredCars = [];
  String searchQuery = '';
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadCars();
  }

  // Cargar los autos de la base de datos
  void _loadCars() async {
    final carsList = await DBHelper().getCars();
    setState(() {
      cars = carsList;
      filteredCars = cars;
    });
  }

  // Filtrar los autos según el texto de búsqueda
  void _filterCars(String query) async {
    setState(() {
      searchQuery = query;
    });
    if (query.isEmpty) {
      setState(() {
        filteredCars = cars; // Mostrar todos los autos si la búsqueda está vacía
      });
    } else {
      final filteredList = await DBHelper().searchCars(query);
      setState(() {
        filteredCars = filteredList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colección de Autos'),
        actions: [
          // Barra de búsqueda en el AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              child: TextField(
                controller: _searchController,
                onChanged: _filterCars,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.4),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Lista de autos filtrados
          Expanded(
            child: ListView.builder(
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                final car = filteredCars[index];
                return ListTile(
                  leading: Image.network(car.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(car.name),
                  subtitle: Text('${car.brand} - ${car.year}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailScreen(car: car),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
