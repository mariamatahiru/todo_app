import 'package:flutter/material.dart';

import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo_app',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
         backgroundColor: Colors.white,
       iconTheme: IconThemeData(color:Colors.blue),
     titleTextStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 25)
        )
      ),
      darkTheme: ThemeData(
       appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25)
       ),
       

       ),
  
    
      themeMode: ThemeMode.dark,
      home: HomeView(),
    );
  } 
}

