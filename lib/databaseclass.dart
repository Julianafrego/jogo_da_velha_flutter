import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseClass {
  static final DatabaseClass instance = DatabaseClass._init();
  static Database? _database;

  DatabaseClass._init();

  Future<Database> get database async {
    _database ??= await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE jogos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          posicao_0 TEXT,
          posicao_1 TEXT,
          posicao_2 TEXT,
          posicao_3 TEXT,
          posicao_4 TEXT,
          posicao_5 TEXT,
          posicao_6 TEXT,
          posicao_7 TEXT,
          posicao_8 TEXT,
          vencedor TEXT,
          data_jogo DATETIME
        )
      ''');
  }

  Future<int> salvarJogo(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('jogos', row);
  }

  Future<List<Map<String, dynamic>>> recuperarJogos() async {
    final db = await instance.database;
    return await db.query('jogos', orderBy: 'data_jogo DESC');
  }

  Future<void> close() async {
    final db = await instance.database;

    db.close();
    _database = null;
  }
}
