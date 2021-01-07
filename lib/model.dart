
import 'package:flutter/material.dart';

import 'api.dart';

class TodoTask {
  String id;
  String message;
  bool done;


  TodoTask({this.id,this.message,this.done = false});

  static Map<String, dynamic> toJson(TodoTask memo) {
    return {
      'title': memo.message,
      'done': memo.done,
    };
  }
  static TodoTask fromJson(Map<String, dynamic> json) {
    return TodoTask(id: json['id'], message: json['title'], done: json['done']);

  }

}
class MyState extends ChangeNotifier {
  List<TodoTask> _list = [];

  List<TodoTask> get list => _list;

  Future getList() async{
    List<TodoTask> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addTodo(TodoTask memo) async{
    _list.add(memo);
    await Api.addTodo(memo);
    print(list);
    getList();
  }
  void removeTask(TodoTask memo) async{
    
    _list = await Api.deleteTodos(memo.id);
    await getList();
    
    
  }
  void boxChecked(TodoTask memo, bool done) async{
    memo.done = done;
    _list = await Api.updateTodo(memo, memo.id);
    await getList();

  }
}

