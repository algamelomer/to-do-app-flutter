import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/widgets/counter.dart';
import 'package:to_do/widgets/to_do_card.dart';
import 'package:to_do/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoApp(),
    );
  }
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

List allTasks = [
  Task(title: "title", status: true),
  Task(title: "title2", status: false),
  Task(title: "title3", status: true),
  Task(title: "title4", status: true),
  Task(title: "title5", status: false),
  Task(title: "title6", status: true),
  Task(title: "title7", status: true),
  Task(title: "title8", status: false),
  Task(title: "title9", status: true),
];

calculateCompletedTask() {
  int i = 0;
  for (var item in allTasks) {
    switch (item.status) {
      case true:
        {
          i++;
        }
    }
  }
  return i;
}

final myController = TextEditingController();

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  // Move addNewTask function here to be able to call setState()
  addNewTask(String title) {
    setState(() {
      allTasks.add(Task(title: title, status: false));
    });
  }

  changeStatus(int index) {
    setState(() {
      allTasks[index].status = !allTasks[index].status;
    });
  }

  deleteTask(int index) {
    setState(() {
      allTasks.remove(allTasks[index]);
    });
  }

  clearTasks() {
    setState(() {
      allTasks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            controller: myController,
                            maxLength: 20,
                            decoration: const InputDecoration(
                                hintText: "Add new Task")),
                        const SizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addNewTask(myController.text);
                          },
                          child: const Text("Add"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              foregroundColor: Colors.blue,
                              textStyle: const TextStyle(fontSize: 22)),
                        )
                      ],
                    ),
                  ));
            },
            // isScrollControlled: true
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              clearTasks();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 30,
            color: Color.fromRGBO(255, 255, 200, 196),
          )
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        title: const Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              completedTasks: calculateCompletedTask(),
              allTasks: allTasks.length,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 100),
                // height: 500,
                color: Color.fromARGB(255, 55, 63, 82),
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ToDoCard(
                        title: allTasks[index].title,
                        status: allTasks[index].status,
                        changeStatus: () => changeStatus(index),
                        deleteTask: () => deleteTask(index),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
