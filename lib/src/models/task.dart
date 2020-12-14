import 'package:flutter/material.dart';

class Task {
  final String title, subtitle, id;
  bool completed;

  Task({
    @required this.title,
    @required this.subtitle,
    @required this.id,
    this.completed: false,
  });

  Task.fromJSON(parsedJSON)
      : title = parsedJSON['title'],
        id = parsedJSON['id'],
        subtitle = parsedJSON['subtitle'],
        completed = parsedJSON['completed'];

  void toggleComplete() {
    completed = !completed;
  }

  bool get isComplete => completed;
}
