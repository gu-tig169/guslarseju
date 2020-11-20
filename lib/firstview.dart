
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

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        actions: [
          _popupWindow()
        ],
              centerTitle: true,
      ),
      body: Consumer<MyState>(
        builder: (context,state, child) => TaskList(state.list)),
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
}
  Widget _popupWindow() {
  return PopupMenuButton<String>(
    itemBuilder: (context) =>[
      PopupMenuItem(child: Text('All'),
      ),
      PopupMenuItem(child: Text('Done'),
      ),
      PopupMenuItem(child: Text('Undone'),
      ),
    ],
    icon: Icon(Icons.more_vert,
    size: 30,
    color: Colors.black,
    ),
  );
}

