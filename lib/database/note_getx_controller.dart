import 'package:flutter/material.dart';
import 'package:notesapp/database/note_db_controller.dart';
import 'package:notesapp/model/noteModel.dart';

class AccountChangeNotifier extends ChangeNotifier {
  List<Note> note = <Note>[];

  AccountChangeNotifier() {
    read();
  }

  Future<void> read() async {
    note = await NoteDbController().read();
    notifyListeners();
  }

  Future<bool> create(Note data) async {
    int id = await NoteDbController().create(data);
    if (id != 0) {
      data.id = id;
      note.add(data);
      notifyListeners();
    }
    return id != 0;
  }

  Future<bool> update(Note data) async {
    bool updated = await NoteDbController().update(data);
    if (updated) {
      int index = note.indexWhere((contact) => contact.id == data.id);
      note[index] = data;
      notifyListeners();
    }
    return updated;
  }

  Future<bool> delete(int id) async {
    bool deleted = await NoteDbController().delete(id);
    if (deleted) {
      note.removeWhere((element) => element.id == id);
      notifyListeners();
    }
    return deleted;
  }
}
