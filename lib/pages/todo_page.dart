/* import 'package:flutter/material.dart';
List<String> tasks = ['play', 'eat', 'sleep', 'repeat'];

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add your tasks here'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(tasks[index]),
                  onDismissed: (direction) {
                    tasks.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task deleted')),
                    );
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(tasks[index]),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController taskController =
                      TextEditingController();
                  return AlertDialog(
                    title: Text('Add Task'),
                    content: TextField(
                      controller: taskController,
                      decoration: InputDecoration(hintText: 'Enter your task'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add logic to save the task
                          print('Task added: ${taskController.text}');
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Add Task'),
          ),          
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Add logic for the button
                  print('Floating Action Button Pressed');
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
 */