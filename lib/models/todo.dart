import 'package:flutter/foundation.dart' show immutable;

@immutable
class Todo {
  final String id;
  final String description;
  final bool completed;

  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}
