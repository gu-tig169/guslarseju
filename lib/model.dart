
import 'package:flutter/material.dart';

class TodoTask {
  String message;
  bool done;


  TodoTask({this.message,this.done = false});
  void inspect(){
    if (this.done == false) {
      this.done = true;
    } else {
      this.done = false;
    }
  }

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
  void boxChecked(TodoTask memo) {
    var idx = list.indexOf(memo);
    _list[idx].inspect();
    notifyListeners();
  }
}