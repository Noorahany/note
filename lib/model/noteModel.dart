import 'package:flutter/material.dart';

class Note {
  late int id;
  late String title;
  late String description;
  late int color;



  static const TABLE_NAME = 'note';

  Note();

  Note.fromMap(Map<String, dynamic> rowMap) {
    this.id = rowMap['id'];
    this.title = rowMap['title'];
    this.description = rowMap['description'];
    this.color = rowMap['color'];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['title'] = this.title;
    map['description'] = this.description;
    map['color'] = this.color;

    return map;
  }
}