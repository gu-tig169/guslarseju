import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';
import 'firstview.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(
    ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first app",
      theme: ThemeData(
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: FirstView(),);
      }
    }
