import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_new/View/loggedin.dart';
import 'package:project_new/View/onboding_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return LoggedIn();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went wrong'),
            );
          } else {
            return const OnbodingScreen();
          }
        },
      ),
    );
  }
}
