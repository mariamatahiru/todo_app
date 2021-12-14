import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_services.dart';

class TodoController{
  final TodoServices _todoServices =TodoServices();

//get in dart
  Future<Todo?>getAllTodos()async{
    Todo? _todo;

    await _todoServices.getAllTodosRequest().then((Response)  {
      int statuscode = Response.statusCode;
      if (statuscode == 201){
        //success
        _todo = Todo.fromMap(json.decode(Response.body));
     } else {
          //failed
          _todo = null;
      }
     }).catchError((onError){
       _todo =null;
     });
     return _todo;
  }

  //create
  Future<bool> createTodo(
    { required String Title,
  required String description,
  required String dateTime
    }
    )async{
      bool isSuccessful =false;
      await _todoServices.createTodosRequest(Title: Title, description: description, dateTime: dateTime)
      .then((Response) {
        int statusCode =Response.statusCode;
        if(statusCode == 201){
          //success
          isSuccessful =true;
        }else {
          //failure
          isSuccessful = false;
        }
      }).catchError((onError){
        isSuccessful =false;
      });
      return isSuccessful =false;
    }

    //delete Todo
    Future<bool> deleteTodo(String id)async{
      bool isDeleted =false;
      await _todoServices.deleteTodoRequest(id).then((Response) {
        int statusCode =Response.statusCode;
        if (statusCode == 200){
          //success
          isDeleted =true;
        }else{
          //failure
          isDeleted =false;
        }
      }).catchError((onError){
        isDeleted =false;
      });
      return isDeleted = false;
    }
}