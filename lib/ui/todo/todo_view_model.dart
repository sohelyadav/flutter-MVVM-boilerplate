import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/data/remote/repository.dart';
import 'package:flutter_mvvm_boilerplate/data/remote/todo/todo_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SortOrder {
  ASC,
  DESC,
}

final _sortOrderState = StateProvider<SortOrder>((ref) => SortOrder.ASC);
final _todoListState = StateProvider<List<TodoApp>?>((ref) => null);

final sortedTodoListState = StateProvider<List<TodoApp>?>((ref) {
  final List<TodoApp>? todoList = ref.watch(_todoListState);

  if (ref.watch(_sortOrderState) == SortOrder.ASC) {
    todoList?.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  } else {
    todoList?.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  return todoList;
});

final todoViewController =
    Provider.autoDispose((ref) => TodoViewController(ref.read));

class TodoViewController {
  final Reader _read;
  TodoViewController(this._read);

  Future<void> initState() async {
    _read(_todoListState.notifier).state =
        await _read(todoRepository).getTodoList();
  }

  void dispose() {
    _read(_todoListState)?.clear();
  }

  Future<void> addTodo(TextEditingController textController) async {
    final String text = textController.text;
    if (text.trim().isEmpty) {
      return;
    }
    textController.text = '';
    final now = DateTime.now();
    final newTodo = TodoApp(
      content: text,
      done: false,
      timestamp: now,
      id: "${now.millisecondsSinceEpoch}",
    );
    final List<TodoApp> newTodoList = [newTodo, ...(_read(_todoListState) ?? [])];
    _read(_todoListState.notifier).state = newTodoList;
    await _read(todoRepository).saveTodoList(newTodoList);
  }

  Future<void> toggleDoneStatus(TodoApp todo) async {
    final List<TodoApp> newTodoList = [
      ...(_read(_todoListState) ?? [])
          .map((e) => (e.id == todo.id) ? e.copyWith(done: !e.done) : e)
    ];
    _read(_todoListState.notifier).state = newTodoList;
    await _read(todoRepository).saveTodoList(newTodoList);
  }

  void toggleSortOrder() {
    _read(_sortOrderState.notifier).state =
        _read(_sortOrderState) == SortOrder.ASC
            ? SortOrder.DESC
            : SortOrder.ASC;
  }
}