import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm_boilerplate/data/remote/todo/todo_response.dart';
import 'package:flutter_mvvm_boilerplate/ui/todo/todo_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoTile extends HookConsumerWidget {
  final TodoApp todoApp;
  const TodoTile({Key? key, required this.todoApp }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(todoApp.content),
        leading: IconButton(
          icon: todoApp.done
              ? const Icon(Icons.check_box, color: Colors.green)
              : const Icon(Icons.check_box_outline_blank),
          onPressed: () {
            ref.read(todoViewController).toggleDoneStatus(todoApp);
          },
        ),
        trailing: Text(todoApp.timestamp.toIso8601String()),
      ),
    );
  }
}

class SimpleTodo extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(todoViewController).initState();
      return ref.read(todoViewController).dispose;
    }, []);
    final textController = useTextEditingController();
    final List<TodoApp>? todoList = ref.watch(sortedTodoListState);
    if (todoList == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Todo')),
      body: Column(
        children: [
          TextField(controller: textController),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  ref.read(todoViewController).toggleSortOrder();
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, int index) =>
                  TodoTile(todoApp: todoList[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todoViewController).addTodo(textController);
        },
      ),
    );
  }
}
