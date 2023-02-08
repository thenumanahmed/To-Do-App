import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';

import '../utilities/dialog_box.dart';
import '../utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    
    // if this is first time ever opening the app, then create default data
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }

    super.initState();
  }

  // reference the hive box
  final _mybox = Hive.box('mybox');

  // text Controller
  final _controller = TextEditingController();

  // list of to do tasks
  // List toDoList = [];

  toDoDatabase db = toDoDatabase();

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //delete a task
  void deleteTask(int index) {
    print(index);
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  //create new task
  void createNewTask() {
    showDialog(
        builder: (context) {
          return DialogBox(
            onSaved: saveNewTask,
            controller: _controller,
            onCancel: Navigator.of(context).pop,
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: ((context, index) {
          return ToDoTile(
            deleteFunction: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        }),
      ),
    );
  }
}
