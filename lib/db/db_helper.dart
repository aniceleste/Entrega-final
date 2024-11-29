import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/auto.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'autos.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE autos(id INTEGER PRIMARY KEY, marca TEXT, nombre TEXT, anio INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertAuto(Auto auto) async {
    final db = await database;
    await db.insert('autos', auto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Auto>> getAutos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('autos');
    return List.generate(maps.length, (i) => Auto.fromMap(maps[i]));
  }

  Future<void> deleteAuto(int id) async {
    final db = await database;
    await db.delete('autos', where: 'id = ?', whereArgs: [id]);
  }
}
