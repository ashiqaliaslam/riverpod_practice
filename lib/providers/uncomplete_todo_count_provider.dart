import 'package:example1/providers/todo_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uncompletedTodosCountProvider = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});
