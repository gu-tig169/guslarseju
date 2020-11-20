import 'package:flutter/material.dart';
import 'model.dart';

class SecondView extends StatefulWidget {
  final TodoTask memo;

  SecondView(this.memo);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(memo);
  }
}

class SecondViewState extends State<SecondView> {
  String message;
 

  TextEditingController textEditingController;

  SecondViewState(TodoTask memo) {
    this.message = memo.message;
  

    textEditingController = TextEditingController(text: memo.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
              centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 39,),
            Container(margin: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What are you going to do?'
              ),
            )
            ),
            Container(height: 47,),
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              FlatButton(
                child: Text('Add', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(
                    context,
                    TodoTask(
                      message: message));
             },
            )
          ])
        ],)
        ),
      ),

    );
  }
}

