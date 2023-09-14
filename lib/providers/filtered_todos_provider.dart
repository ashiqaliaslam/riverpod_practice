import 'package:example1/models/todo.dart';
import 'package:example1/providers/todo_list_filter_provider.dart';
import 'package:example1/providers/todo_list_provider.dart';
import 'package:example1/models/todo_list_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilterProvider);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.all:
      return todos;
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
  }
});
