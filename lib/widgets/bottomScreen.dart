import 'package:flutter/material.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key, required this.newTaskCallBack});

  final Function newTaskCallBack;

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.indigo[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.indigo[300],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextField(
              controller: _taskController,
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.indigo),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  widget.newTaskCallBack(_taskController.text);
                  _taskController.clear();
                }
                print("exiting");
                Navigator.pop(context);
              },

              //     () {
              //   setState(() {
              //     if (_taskController.text.isNotEmpty) {
              //       widget.tasks.add(Task(name: _taskController.text));
              //       print(widget.tasks);
              //       _taskController.clear();
              //     }
              //     Navigator.pop(context);
              //   });
              // },
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[300],
                  shape: BeveledRectangleBorder()),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
