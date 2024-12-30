import 'package:flutter/material.dart';
import 'package:todoeey/classes/tasks.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key, required this.tasks});

  List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTiles(task: widget.tasks[index]);
      },
      itemCount: widget.tasks.length,
    );
  }
}

class TaskTiles extends StatefulWidget {
  TaskTiles({
    required this.task,
  });

  final Task task;

  @override
  State<TaskTiles> createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  checkedCallBack(checkedBoxState) {
    setState(() {
      widget.task.taskChecked();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          this.widget.task.name,
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.indigo,
            decoration:
                widget.task.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: TextCheckBox(
          checkedCallBack: checkedCallBack,
          isChecked: widget.task.isChecked,
        ));
  }
}

class TextCheckBox extends StatelessWidget {
  const TextCheckBox(
      {super.key, required this.checkedCallBack, required this.isChecked});
  final bool isChecked;
  final ValueChanged<bool?>? checkedCallBack;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: checkedCallBack,
      side: BorderSide(color: Colors.indigo, width: 1.5),
    );
  }
}
