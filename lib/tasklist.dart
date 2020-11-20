
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';


class TaskList extends StatelessWidget {
  final List<TodoTask> list;

  TaskList(this.list);

  Widget build(BuildContext context) {
   
    return ListView(
      children: list.map((memo) => _taskItem(context, memo)).toList()
      );
    }
  }
  Widget _taskItem(context, TodoTask memo) {
    return ListTile(
              leading: Checkbox(
                value: memo.done, 
                onChanged: (bool val){
                  var state = Provider.of<MyState>(context, listen: false);
                  state.boxChecked(memo);
                }),
              
              title: Text(memo.message,
              style: TextStyle(
                decoration: (memo.done ? TextDecoration.lineThrough : TextDecoration.none)
              )
              ),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  var state = Provider.of<MyState>(context, listen: false);
                  state.removeTask(memo);
                },
                ),
                );
  }
