import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db_create_tables.dart';

class DatabaseService {
  DatabaseService._init();

  static final DatabaseService instance = DatabaseService._init();

  static Database? _database;

  final int _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase(
      database: 'monitoramento_energia_mobile.db',
    );

    return _database!;
  }

  Future<Database> _initDatabase({required String database}) async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, database);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDatabase,
      onUpgrade: _updateDatabase,
    );
  }

  Future _createDatabase(Database db, int version) async {
    ///Executar um `db.execute` para cada tabela
    await db.execute(DBCreateTables.usuarios);
    await db.execute(DBCreateTables.configuracoes);
    await db.execute(DBCreateTables.monitoramento);
  }

  Future _updateDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  static Future<void> closeDatabase() async {
    final Database db = await instance.database;
    await db.close();
  }

  static Future<Database>? getDb() async {
    return await instance.database;
  }
}
