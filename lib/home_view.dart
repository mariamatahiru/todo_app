import 'package:flutter/material.dart';
class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
       padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(backgroundImage: AssetImage ('assets/unsplash.jpg'),
          ),
        ),
        title: Text('My Task',
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
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(Icons.check_circle_outline,color: Colors.pink,
            ),
           const SizedBox(width: 10,),
            Column(
              mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
               children: [
              Text('Plan a trip to Finland',style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(37, 43, 103, 1),
              ),
              ),
           SizedBox(height: 5,
           ),
           Text('to plan a trip to finland with friends and relatives',
           maxLines: 2,
           overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey,
           fontSize: 16
           ),
           )
            ]
             ),
             SizedBox(width: 10,),
             Row(children: [
               Icon(Icons.notifications,color: Colors.pink,),
              Text('yesterday',style: TextStyle(color: Colors.pink),
               ),
             ],)
              ],
        ),
      ),),
      floatingActionButton: FloatingActionButton(
         child: Icon(
           Icons.add,
           size: 30,
         ),
         onPressed: () {},
         backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(37, 43, 103, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
              Icon(Icons.check_circle_outline_rounded)
          ],),
            ),
          ),
        ),
      ),
    );
  }
}