import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session_app/todo/todo.dart';

final simpleProvider = Provider<int>((ref) {
  return 42;
});

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

////for todo things here

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(Todo newtodo) {
    state = [...state, newtodo];
  }

  void deleteTodo(Todo todo) {
    if (state.isNotEmpty) {
      state.removeWhere((existedTodo) {
        return existedTodo == todo;
      });
      state = [...state];
    }
  }
}

final todosProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());
