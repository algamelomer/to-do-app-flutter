import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final bool status;
  final Function changeStatus;
  final Function deleteTask;

  const ToDoCard(
      {super.key,
      required this.title,
      required this.status,
      required this.changeStatus,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: EdgeInsets.only(top: 33),
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Color.fromRGBO(209, 224, 224, 0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                decoration:
                    status ? TextDecoration.lineThrough : TextDecoration.none,
                color: status ? Colors.black : Colors.white,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    changeStatus();
                  },
                  child: status
                      ? Icon(
                          Icons.done,
                          color: Colors.green[400],
                          size: 27,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 27,
                        ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    deleteTask();
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 27,
                  color: Color.fromRGBO(255, 255, 200, 196),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
