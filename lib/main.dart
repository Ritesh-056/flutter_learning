import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session_app/custom_paint/draw_circle.dart';
import 'package:session_app/riverpod/providers.dart';
import 'package:session_app/todo/todo_form.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyPage(),
    ),
  ); //entry point of the application
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TodoForm(),
      home: const DrawCircle(),
    );
  }
}

class MyHome extends ConsumerWidget {
  const MyHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "Current value is:  \n" + count.toString(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              ref.watch(counterProvider.notifier).increment();
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              ref.watch(counterProvider.notifier).decrement();
            },
          ),
        ],
      ),
    );
  }
}
