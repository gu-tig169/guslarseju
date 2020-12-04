
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'secondview.dart';
import 'tasklist.dart';



class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  var filterBy = 'all';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        actions: [
           PopupMenuButton(
             onSelected: (value) {
               setState(() {
                 filterBy = value;
               });
             },
             itemBuilder: (context) => [
               PopupMenuItem(child: Text('all'), value: 'all'),
               PopupMenuItem(child: Text('undone'), value: 'undone'),
               PopupMenuItem(child: Text('done'), value: 'done'),
             ]),
           
           ],
           centerTitle: true,),
           body: Consumer<MyState>(
             builder: (context,state, child) => TaskList(_filteredList(state.list, filterBy))),
             floatingActionButton: FloatingActionButton(
               child: Icon(Icons.add),
               onPressed: () async {
                 var newTask = await Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => SecondView(TodoTask (message: '', ))));
                     if (newTask != null) {
                       Provider.of<MyState>(context, listen: false).addTodo(newTask);
                       }
        },
      )
    );
  }
  List<TodoTask> _filteredList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'undone')
      return list.where((item) => item.done == false).toList();
    if (filterBy == 'done')
      return list.where((item) => item.done == true).toList();
    
    return list;
  }
}



