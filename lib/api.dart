import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '24007f11-6536-4df7-93ce-94f7d5ecf872';

class Api {
  static Future addTodo(TodoTask memo) async {
    print(memo);
  
    var json = jsonEncode(TodoTask.toJson(memo));
    print(json);

    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},

    );
    print('done');

  }
  static Future deleteTodos(String todoId) async{
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');

  }
    static Future updateTodo(TodoTask memo, todoId) async {
    print(memo);
  
    var json = jsonEncode(TodoTask.toJson(memo));
    print(json);
    await http.put('$API_URL/todos/$todoId?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  
  }

  static Future<List<TodoTask>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);

    return json.map<TodoTask>((data){
      return TodoTask.fromJson(data);
    }).toList();
  }
}
