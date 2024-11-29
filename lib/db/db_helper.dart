import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:proyecto_final/models/car.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  static Database? _database;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializar la base de datos
  _initDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(join(path, 'cars_database.db'), version: 1,
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE cars (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          brand TEXT,
          year INTEGER,
          imageUrl TEXT,
          description TEXT
        )
      ''');
    });
  }

  // Obtener todos los autos
  Future<List<Car>> getCars() async {
    final db = await database;
    var result = await db.query('cars');
    return result.map((car) => Car.fromMap(car)).toList();
  }

  // Método para insertar un auto
  Future<int> insertCar(Car car) async {
    final db = await database;
    return await db.insert('cars', car.toMap());
  }

  // Método para buscar autos según el nombre, marca o año
  Future<List<Car>> searchCars(String query) async {
    final db = await database;
    var result = await db.query(
      'cars',
      where: 'name LIKE ? OR brand LIKE ? OR year LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );
    return result.map((car) => Car.fromMap(car)).toList();
  }
}
