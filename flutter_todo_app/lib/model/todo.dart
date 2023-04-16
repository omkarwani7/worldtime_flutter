import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone = false;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'College', isDone: true),
      ToDo(id: '02', todoText: 'Rest', isDone: true),
      ToDo(
        id: '03',
        todoText: 'DSA',
      ),
      ToDo(
        id: '04',
        todoText: 'Workout',
      ),
      ToDo(
        id: '05',
        todoText: 'Flutter',
      ),
    ];
  }
}
