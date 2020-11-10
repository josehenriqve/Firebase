import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) => Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'ok',
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('mensagens')
              .snapshots()
              .listen((event) {
            event.docs.forEach((element) {
              print(element['msg']);
            });
          });
        },
      ),
    );
  }
}
