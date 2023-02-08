import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  //run this method if this is 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["1st Task.", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update the database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
