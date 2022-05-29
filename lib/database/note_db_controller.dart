
import 'package:sqflite/sqflite.dart';

import '../model/noteModel.dart';
import 'db_controller.dart';
import 'db_operations.dart';


class NoteDbController implements DbOperations<Note> {
  final Database _database = DBProvider().database;

  @override
  Future<int> create(Note object) async {
    return await _database.insert('note', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int numberOfDeletedRows = await _database.delete('note', where: 'id = ?', whereArgs: [id]);
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<Note>> read() async{
    List<Map<String, dynamic>> rows = await _database.query('note');
    return rows.map((rowMap) => Note.fromMap(rowMap)).toList();
  }

  @override
  Future<Note?> show(int id)async {
    List<Map<String, dynamic>> rows =await _database.query('note',where: 'id = ?',whereArgs: [id]);
    return rows.isNotEmpty ? Note.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(Note object) async {
    int numberOfUpdatedRows = await _database.update('note', object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return numberOfUpdatedRows > 0;
  }
}
