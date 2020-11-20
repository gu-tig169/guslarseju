
import 'package:flutter/material.dart';

class TodoTask {
  String message;


  TodoTask({this.message});

}
class MyState extends ChangeNotifier {
  List<TodoTask> _list = [
    TodoTask(message: '')
  ];

  List<TodoTask> get list => _list;

  void addTodo(TodoTask memo) {
    _list.add(memo);
    notifyListeners();
  }
  void removeTask(TodoTask memo) {
    _list.remove(memo);
    notifyListeners();
    
  }
}