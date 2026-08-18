import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/equipment_model.dart';

class DatabaseEquipment {
  DatabaseEquipment._();

  static final DatabaseEquipment _instance = DatabaseEquipment._();

  factory DatabaseEquipment() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'labtrack.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE equipment(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              category TEXT,
              location TEXT,
              status TEXT,
              condition TEXT,
              assignedTo TEXT
            )
          ''');
        },
      );
    } catch (e) {
      throw Exception('Database Error: $e');
    }
  }

  // CREATE
  Future<int> addEquipment(
    EquipmentModel equipment,
  ) async {
    final db = await database;

    return await db.insert(
      'equipment',
      equipment.toMap(),
    );
  }

  // READ
  Future<List<EquipmentModel>> getAllEquipment() async {
    final db = await database;

    final data = await db.query(
      'equipment',
      orderBy: 'id DESC',
    );

    return data
        .map(
          (item) => EquipmentModel.fromMap(item),
        )
        .toList();
  }

  // UPDATE
  Future<int> updateEquipment(
    EquipmentModel equipment,
  ) async {
    final db = await database;

    return await db.update(
      'equipment',
      equipment.toMap(),
      where: 'id = ?',
      whereArgs: [equipment.id],
    );
  }

  // DELETE
  Future<int> deleteEquipment(int id) async {
    final db = await database;

    return await db.delete(
      'equipment',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
