import 'package:example1/constants/unique_keys.dart';
import 'package:example1/providers/current_todo_provider.dart';
import 'package:example1/providers/filtered_todos_provider.dart';
import 'package:example1/providers/todo_list_provider.dart';
import 'package:example1/views/title_view.dart';
import 'package:example1/views/todo_item_view.dart';
import 'package:example1/views/toolbar_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyHomePage extends HookConsumerWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newTodoController = useTextEditingController();
    final todos = ref.watch(filteredTodosProvider);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // title: Text(title),
      //   title: const TitleView(),
      // ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const TitleView(),
          TextField(
            key: addTodoKey,
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: 'What needs to be done?'),
            onSubmitted: (value) {
              ref.read(todoListProvider.notifier).add(value);
              newTodoController.clear();
            },
          ),
          const SizedBox(height: 42),
          const ToolBar(),
          if (todos.isNotEmpty) const Divider(height: 0),
          for (var i = 0; i < todos.length; i++) ...[
            if (i < 0) const Divider(height: 0),
            Dismissible(
              key: ValueKey(todos[i].id),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).remove(todos[i]);
              },
              child: ProviderScope(
                overrides: [
                  currentTodoProvider.overrideWithValue(todos[i]),
                ],
                child: const TodoItem(),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
