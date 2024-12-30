import 'package:flutter/material.dart';
import 'package:todoeey/classes/tasks.dart';
import 'package:todoeey/widgets/bottomScreen.dart';
import 'package:todoeey/widgets/taskWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    // List<Task> tasks = [
    //   Task(name: 'Buy bread'),
    // ];

    void newTaskCallBack(String newTask) {
      setState(() {
        tasks.add(Task(name: newTask));
      });
      print(tasks);
    }

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.indigo[100],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 60.0, bottom: 35.0, left: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 45.0,
                        color: Colors.indigo[100],
                      ),
                      backgroundColor: Colors.white,
                      radius: 35.0,
                    ),
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 55.0),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Expanded(
                      child: TaskList(
                        tasks: tasks,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.indigo[100],
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  child: BottomScreen(
                    newTaskCallBack: newTaskCallBack,
                  ),
                ),
              ),
            );
          },
          shape: CircleBorder(eccentricity: 0.0),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35.0,
          ),
        ),
      ),
    );
  }
}
