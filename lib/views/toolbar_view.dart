import 'package:example1/constants/unique_keys.dart';
import 'package:example1/models/todo_list_filter.dart';
import 'package:example1/providers/todo_list_filter_provider.dart';
import 'package:example1/providers/uncomplete_todo_count_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToolBar extends HookConsumerWidget {
  const ToolBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilterProvider);
    final todosCount = ref.watch(uncompletedTodosCountProvider);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.blue : Colors.grey;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$todosCount items left',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Tooltip(
          key: allFilterKey,
          message: 'All todos',
          child: TextButton(
            onPressed: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.all;
            },
            style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              foregroundColor: MaterialStateProperty.all(
                textColorFor(TodoListFilter.all),
              ),
            ),
            child: const Text('All'),
          ),
        ),
        Tooltip(
          key: activeFilterKey,
          message: 'Only uncompleted todos',
          child: TextButton(
            onPressed: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.active;
            },
            style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              foregroundColor: MaterialStateProperty.all(
                textColorFor(TodoListFilter.active),
              ),
            ),
            child: const Text('Active'),
          ),
        ),
        Tooltip(
          key: completedFilterKey,
          message: 'Only completed todos',
          child: TextButton(
            onPressed: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.completed;
            },
            style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              foregroundColor: MaterialStateProperty.all(
                textColorFor(TodoListFilter.completed),
              ),
            ),
            child: const Text('Completed'),
          ),
        ),
      ],
    );
  }
}
