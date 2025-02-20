import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> taskList = [];
  TextEditingController textController = TextEditingController();
  String message = "Please enter a task";
  bool showiest = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),

                    child: TextField(
                      controller: textController,
                      onSubmitted: (value) => {
                        setState(() {
                          if (textController.text.isEmpty) {
                            message = "Please enter a task";
                            showiest = true;
                          } else {
                            message = "";
                            taskList.add(textController.text);
                             showiest = false;
                            textController.text = "";
                          }
                        })
                      },
                      decoration: InputDecoration(
                        label: Text("Enter your task"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (textController.text.isEmpty) {
                        message = "Please enter a task";
                         showiest = true;
                      } else {
                        taskList.add(textController.text);
                        message = "";
                         showiest = false;
                        textController.clear();
                      }
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Add Task"),
                ),
              ],
            ),
            Visibility(
              visible: showiest,
              child: 
            Text(message, style: TextStyle(color: Colors.red),)
            ),
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(taskList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
