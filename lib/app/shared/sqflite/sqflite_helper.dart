import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class SqfliteHelper {
  String get _nameDb => 'despesas_pessoais.db';

  final int _versionDb = 1;

  static Database? _db;

  SqfliteHelper();

  _onCreate(Database db, int version) async {
    var batch = db.batch();

    batch.execute('''
      CREATE TABLE despesa (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        valor REAL,
        data TEXT
      )
    ''');

    await batch.commit(noResult: true);
  }

  Future<String> getPath() async {
    var databasesPath = '';
    var path = '';
    if (Platform.isIOS) {
      databasesPath = (await getApplicationSupportDirectory()).path;
    } else {
      databasesPath = await getDatabasesPath();
    }

    path = join(databasesPath, _nameDb);
    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (ex) {
      print('Erro ao criar diretório: ${ex}');
    }

    return path;
  }

  Future<Database> getDb() async {
    _db ??= await openDatabase(
      await getPath(),
      version: _versionDb,
      onCreate: _onCreate,
    );

    return _db!;
  }
}
