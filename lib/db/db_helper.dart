import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/car.dart';

class DBHelper {
  static Database? _database;

  // Obtén la instancia de la base de datos
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    // Si no existe, crea una nueva base de datos
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = await getDatabasesPath() + 'cars.db';
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Crear las tablas de la base de datos
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        imageUrl TEXT,
        brand TEXT,
        year INTEGER
      )
    ''');
  }

  // Insertar un auto
  Future<int> insertCar(Car car) async {
    final db = await database;
    return await db.insert('cars', car.toMap());
  }

  // Obtener todos los autos
  Future<List<Car>> getCars() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cars');
    return List.generate(maps.length, (i) {
      return Car.fromMap(maps[i]);
    });
  }
}
