import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loggedin extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text('anmol'),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text('logout'),
            onPressed: () {},
          )
        ],
      )),
      body: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
