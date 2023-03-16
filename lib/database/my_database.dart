import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  String stationTable = 'station';
  String favoriteTable = 'favorite';

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if(_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  DatabaseHelper._internal();

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_management_f.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $stationTable (
        stationCode TEXT PRIMARY KEY,
        stationId TEXT,
        outerCode TEXT,
        stationName TEXT,
        lineNum TEXT,
        lineName TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE $favoriteTable(
        no INTEGER PRIMARY KEY,
        type TEXT,
        startTime TEXT,
        endTime TEXT,
        name TEXT,
        id TEXT,
        timeStamp INTEGER
      )
    ''');
  }

}