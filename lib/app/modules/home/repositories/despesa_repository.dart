import 'package:despesas_pessoais/app/modules/home/repositories/despesa_repository_interface.dart';
import 'package:despesas_pessoais/app/shared/sqflite/sqflite_helper.dart';
import 'package:despesas_pessoais/app/modules/home/dtos/despesa_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

class DespesaRepository extends Disposable implements IDespesaRepository {
  static const _table = 'despesa';

  Future<Database> _database() {
    return SqfliteHelper().getDb();
  }

  Future<int> insert(DespesaDto despesa) async {
    final Database db = await _database();
    try {
      return await db.insert(_table, despesa.toMap());
    } catch (error) {
      print(error);
    }
    return 0;
  }

  Future<List<DespesaDto>> queryAllRows() async {
    final Database db = await _database();
    try {
      final maps = await db.query(_table);
      return List.generate(maps.length, (i) {
        return DespesaDto.fromMap(maps[i]);
      });
    } catch (error) {
      print(error);
    }
    return [];
  }

  Future<int> queryRowCount() async {
    final Database db = await _database();
    try {
      return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $_table')) ?? 0;
    } catch (error) {
      print(error);
    }
    return 0;
  }

  Future<int> update(DespesaDto despesa) async {
    final Database db = await _database();
    try {
      return await db.update(
        _table,
        despesa.toMap(),
        where: 'id = ?',
        whereArgs: [despesa.id],
      );
    } catch (error) {
      print(error);
    }
    return 0;
  }

  Future<int> delete(int id) async {
    final Database db = await _database();
    try {
      return await db.delete(
        _table,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (error) {
      print(error);
    }
    return 0;
  }

  Future<DespesaDto> findById(int id) async {
    final Database db = await _database();
    try {
      final maps = await db.query(
        _table,
        where: 'id = ?',
        whereArgs: [id],
      );
      return DespesaDto.fromMap(maps.first);
    } catch (error) {
      print(error);
    }
    return DespesaDto();
  }

  @override
  void dispose() {}
}
