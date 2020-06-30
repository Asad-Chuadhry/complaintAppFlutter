import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Complaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('complaint').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Center(child:CircularProgressIndicator());
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return Column(
                  children: <Widget>[
                    new ListTile(
                      leading: CircleAvatar(
                        child: Text(document['name'].toString()[0]),),
                      title: new Text(document['name']),
                      trailing: new Text(document['date'].toDate().toString().substring(0,16)),
                      subtitle: new Text(document['email']),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        readOnly: true,
                        maxLines: null,
                        initialValue: document['complaint'],
                      ),
                    )
                  ],
                );
              }).toList(),
            );
        }
      },
    );

  }
}