import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final completedTasks;
  final allTasks;
  const Counter(
      {super.key, required this.completedTasks, required this.allTasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text(
        "$completedTasks / $allTasks ",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: completedTasks == allTasks ? Colors.green : Colors.white,
            fontSize: 44),
      ),
    );
  }
}
