import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({ Key? key }) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final TextEditingController _titleController =TextEditingController();
  final TextEditingController _descriptionController  =TextEditingController();
  final TextEditingController _dateController =TextEditingController();
  final TextEditingController _timeController =TextEditingController();
  final GlobalKey<FormState> _formkey =GlobalKey();
  final TodoController _todoController =TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Todo'),
      ),
      body:Form(
        key: _formkey,
        child:ListView(
          padding: const EdgeInsets.all(15),
          children: [
        TextFormField(
          controller: _titleController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(label: Text('Title'),
          hintText: 'Please input your title here',
          floatingLabelBehavior:FloatingLabelBehavior.never,focusedBorder: UnderlineInputBorder(
            borderSide:BorderSide(color: CostomBlue), 
          ), 
          ),
          validator: (value){
            if(value! .isEmpty){
              return 'Please enter a title';
            }
          },
        ),
        SizedBox(height: 15,
        ),
        TextFormField(
          keyboardType: TextInputType.multiline,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 5,
          decoration:InputDecoration(label: Text('Discription'),
          hintText: 'Please enter a description here',
          floatingLabelBehavior:FloatingLabelBehavior.never,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CostomBlue),
          ),
          ),
          validator: (value){
            if(value! .isEmpty){
              return 'Please enter a description';
            }
          },
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onTap: (){
                  showDatePicker(context: context,
                   initialDate: DateTime.now(),
                    firstDate:DateTime.now() ,
                   lastDate: DateTime.now().add(const Duration(days: 365))).then((value) {
                     setState(() {
                       _dateController.text = DateFormat.yMMMMd().format(value!);
                     });
                   });
                },
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 1,
                decoration: InputDecoration(
                  label: Text('Date'),
                  hintText: 'Please select a date',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CostomBlue),
                  )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter a date';
                   } if(value == DateFormat.yMMMMd().format(DateTime.now())){
                      return 'You selected today\'s date';
                    }
                },
              ),
            ),
            SizedBox(width: 20,),
            Expanded(child: TextFormField(
              onTap: (){
                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                  setState(() {
                    _timeController.text = value! .format(context);
                  });
                });
              },
               keyboardType: TextInputType.datetime,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 1,
                decoration: InputDecoration(
                  label: Text('Time'),
                  hintText: 'please select a time',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CostomBlue),
            ),
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please enter a time';
              }if(value == DateFormat.yMMMMd().format(DateTime.now())){
                      return 'You selected today\'s time';
              }
             }
              ),
            )],
        ),
        SizedBox(height: 35,),
        TextButton(onPressed: ()async{
          if(_formkey.currentState!.validate()){
            String dateTime = _dateController.text + " " + _timeController.text;

            //Todo isLoading
            setState(() {
              
            });

            bool isSucessfull = await _todoController.createTodo
            (Title: _titleController.text, description: _descriptionController.text, dateTime: dateTime);
          }
        }, child:Text('Create Todo',
        style: TextStyle(color: Colors.white),
        ),
        style: TextButton .styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: CostomBlue,
        ),
        ),
      ],
      ),
      ) ,
      
    );
  }
}