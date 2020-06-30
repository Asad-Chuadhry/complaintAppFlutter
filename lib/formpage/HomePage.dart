import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'complaint.dart';
import 'form.dart';
class MyHome extends StatefulWidget {
  @override
  _MyHome createState() => _MyHome();
}

  class _MyHome extends State<MyHome> {
  final fb = FirebaseDatabase.instance.reference().child("MY DATA");
 
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      
      child:Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: <Widget>[
            Column(children: <Widget>[
              Icon(Icons.pan_tool),
              Text("New Complaint")
            ],),
            Column(children: <Widget>[
              Icon(Icons.home),
              Text("Old Complaints")
            ],)
        ],),
    title: Text("Home Page"),
  ) ,
  body: TabBarView(
    children: <Widget>[
      form(),
      Complaint()

  ],)));
}

}
