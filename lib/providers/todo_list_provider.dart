import 'package:example1/models/todo.dart';
import 'package:example1/models/todo_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = NotifierProvider<TodoList, List<Todo>>(TodoList.new);
