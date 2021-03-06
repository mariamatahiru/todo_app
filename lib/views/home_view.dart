

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/views/create_todo.dart';
import 'package:todo_app/views/todo_tile_view.dart';
import 'create_todo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/controllers/todo_controller.dart';


import '../utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TodoController _todoController =TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/unsplash.jpg'),
          ),
        ),
        title: Text(
          'My Task',
        ),
        elevation: 0,
        actions: [
          Icon(Icons.sort),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<Todo?>(
        future: null,
        builder: (context, snapshot) {
          if(snapshot .connectionState == ConnectionState.waiting && snapshot.data == null){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.connectionState == ConnectionState.done && snapshot.data == null){
            return const Text('ooops! something went wrong',style: TextStyle(fontSize: 30),
            );
          }
          return ListView.separated(itemBuilder: (context,index){
            return  TodoTileView(
              todo: snapshot.data!.data[index],
            );
          }, separatorBuilder: (context, index){
            return SizedBox(
              height:18
            );
          },
          itemCount: snapshot.data!.data.length);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:(context){
            return CreateTodoView();
          } ));
        },
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(37, 43, 103, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  showBarModalBottomSheet(context: context,
                   builder:(context){
                     return CompletedTodoWidget();
                   });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: CostomBlue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(
                              color: CostomBlue, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: CostomBlue,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text( '24',
                      style: TextStyle(color: CostomBlue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedTodoWidget extends StatelessWidget {
  const CompletedTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
       leading: Icon(Icons.check_circle_outline,
       color: CostomBlue,
       ),
       title:Text('Plan a trip to Finland',
       style: TextStyle(fontWeight: FontWeight.w600,
       color: CostomBlue
       ),
       ),
       subtitle: Text('to plan a trip to finland with friends and relatives',
       style: TextStyle(fontSize: 16),
       ),
       trailing:Row(
         mainAxisSize: MainAxisSize.min,
         children: [Icon(
                    Icons.notifications,
                    color: CostomBlue,
          ),
          Text('yesterday',style: TextStyle(color:CostomBlue),
          ),
          ],
          
       )
      ),
    );
  }
}

