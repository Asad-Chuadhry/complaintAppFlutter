
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  var _formKey=new GlobalKey<FormState>();
  String name, email, complaint;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key:_formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('asset/giki.jpg',
                    height: 100,
                    width: 100,)
                  ],
                ),
                TextFormField(
                  onChanged: (val){
                    email=val;

                  },
                  decoration: new InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'e.g; u2017438@giki.edu.pk',
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    icon: new Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  onChanged: (val){
                    name=val;

                  },
                  decoration: new InputDecoration(
                    labelText: 'Enter your name',

                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    icon: new Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  maxLines: 4,
                  onChanged: (val){
                    complaint=val;

                  },
                  decoration: new InputDecoration(
                    labelText: 'Enter your complaint',
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    icon: new Icon(Icons.pan_tool),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 200.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      
                      Firestore.instance.collection('complaint').document()
                      .setData({
                        "email":email,
                        "name":name,
                        "complaint":complaint,
                        "date":DateTime.now()
                      }).then((_){
                        print("ffffff");
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          child: CupertinoAlertDialog(
                            title: Text("Submitted"),
                            content: Text("Complaint sumitted successfully"),
                          )
                          );
                      },
                      onError: (error){
                        showDialog(
                          context: context,
                          child: CupertinoAlertDialog(
                            title: Text("Error"),
                            content: Text(error.toString()),
                          )
                          );
                          
                      }
                      );
                      showDialog(
                          context: context,
                          child: CupertinoAlertDialog(
                            title: Text("Submitted"),
                            content: Text("Complaint sumitted successfully"),
                          )
                          );
                          _formKey.currentState.reset();
                    },
                    child: new Text(
                      'SUBMIT',
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                )

              ],
            ),
          ),
        ),
    );
  }
}
