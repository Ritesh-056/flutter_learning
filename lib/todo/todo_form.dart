import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session_app/riverpod/providers.dart';
import 'package:session_app/todo/todo.dart';

class TodoForm extends ConsumerWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;
                final newTodo =
                    Todo(title: title, description: description, status: 0);

                //add new todo
                ref.read(todosProvider.notifier).addTodo(newTodo);
                titleController.clear();
                descriptionController.clear();
              },
              child: Text('Add Todo'),
            ),
            todos.isEmpty
                ? const Center(
                    child: Text('todo is empty'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: TextStyle(fontSize: 40),
                        ),
                        selectedTileColor: Colors.green,
                        title: Text(todos[index].title),
                        subtitle: Text(todos[index].description),
                        trailing: GestureDetector(
                          onTap: (){
                             ref.read(todosProvider.notifier).deleteTodo(todos[index]);
                          },
                          child: Icon(Icons.delete),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
