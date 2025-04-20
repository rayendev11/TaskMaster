import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Task> tasks = [];
  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: 80, 
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              String thisDate = task.dueDate.toString().split(' ')[0]; 
              bool isNewDay = index == 0 || task.dueDate.toString().split(' ')[0] != tasks[index - 1].dueDate.toString().split(' ')[0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isNewDay)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            thisDate,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                      
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C2C2C),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                      "From: ${task.startTime != null ? task.startTime!.format(context) : 'Not set'} "
                                      "to: ${task.endTime != null ? task.endTime!.format(context) : 'Not set'}", 
                                      style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  Text(
                                    "Priority: ${task.priority ?? 'Not set'}",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            Checkbox(
                              value: task.isDone,
                              onChanged: (value) {
                                setState(() {
                                  task.isDone = value!;
                                });
                              },
                              activeColor: Color(0xFF4A90E2),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFFF6F61),
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () => _showTaskDialog(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  void _showTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        DateTime dueDate = DateTime.now();
        DateTime? pickedDate;
        TimeOfDay? startTime;
        TimeOfDay? endTime;
        String? priority;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("New Task!"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(hintText: "Enter task name"),
                    onChanged: (value) => setState(() => title = value),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    onChanged: (value) => setState(() => description = value),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        dueDate = pickedDate!;
                      });

                      final pickedStartTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedStartTime == null) return;

                      final pickedEndTime = await showTimePicker(
                        context: context,
                        initialTime: pickedStartTime,
                      );

                      if (pickedEndTime == null) return;

                      setState(() {
                        startTime = pickedStartTime;
                        endTime = pickedEndTime;
                      });
                    }
                    },
                    child: Text(
                      pickedDate == null
                          ? 'Pick Due Date'
                          : 'Date: ${pickedDate!.toLocal().toString().split(' ')[0]}\nStart:${startTime != null ? startTime!.format(context) : 'Not set'}\nEnd:${endTime != null ? endTime!.format(context) : 'Not set'}',

                    ),
                  ),
                  
                  DropdownButton<String>(
                    value: priority,
                    hint: Text("Select Priority"),
                    items: ['Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        priority = newValue;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text("Create"),
                  onPressed: () {
                    if (title != '' && description != '' && pickedDate != null && priority != null ) {
                    Task newTask = Task(
                      title: title,
                      description: description,
                      dueDate: dueDate,
                      startTime: startTime,
                      endTime: endTime,
                      priority: priority,
                    );
                    addTask(newTask);
                    tasks.sort((a, b) {
                      return a.dueDate.compareTo(b.dueDate); 
                    });
                    Navigator.pop(context);
                    }else{
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please choose all of the values'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );                    
                      }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

List<String> weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];


class Task {
  final String title;
  final String description;
  DateTime dueDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isDone;
  final String? priority;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.startTime,
    required this.endTime,
    this.isDone = false,
    this.priority,
  });

  String getDetails() {
    return 'Task: $title\nDescription: $description\nDue: ${dueDate.toLocal().toString()}\nPriority: ${priority ?? 'Not set'}\nCompleted: ${isDone ? 'Yes' : 'No'}';
  }
}