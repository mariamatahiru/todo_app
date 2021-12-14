import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


class TodoServices{
  Future<Response>getAllTodosRequest()async{
return await get(Uri.parse('https://arcane-forest-91267.herokuapp.com/todos'));
  }

// create Todo
Future<Response>createTodosRequest({
  required String Title,
  required String description,
  required String dateTime
}

)async{
Map<String,String> header={
  'Content-Type':'application/json'
};
Map<String,String> body ={
  'title':Title,
  'description':description,
  'dateTime':dateTime
};

return await post(Uri.parse('https://arcane-forest-91267.herokuapp.com/todos'),
body: jsonEncode(body),headers: header
);
}

//update a Todo
Future<Response>updateTodoRequest({
  required bool status,
  required String id
})async{
  Map<String,bool>body={'status':status};
  Map<String,String>header={'content Type':'application/json'};
   return await patch(Uri.parse('https://arcane-forest-91267.herokuapp.com/todos'),
  body: jsonEncode(body),
  headers: header
  );
}

//delete a Todo
Future<Response>deleteTodoRequest(String id) async{
  return await delete(
    Uri.parse('https://arcane-forest-91267.herokuapp.com/todos/$id'));
  
}
}