import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_new/navigation_drawer.dart';
import 'package:provider/provider.dart';
import 'Authentication/google_sign_in.dart';


class loggedin extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   loggedin({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(

        ),
        body: Stack(
          children: [
            Container(
              color: Colors.blue,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.home_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      Icon(Icons.recent_actors, size: 40, color: Colors.white),
                      Icon(Icons.favorite, size: 40, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(top: 350, left: 18),
              elevation: 10,
              color: const Color.fromARGB(255, 235, 235, 235),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: const SizedBox(
                width: 320,
                height: 290,
              ),
            ),
            Row(children: const [
              Padding(padding: EdgeInsets.only(top: 600, left: 15)),
              Text(
                "Select Files",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.only(left: 140.0, top: 275.0),
                child: Container(
                  height: 50,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(133, 221, 221, 221),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt,
                            size: 30, color: Colors.blueAccent),
                        VerticalDivider(),
                        Icon(Icons.image, size: 30, color: Colors.blueAccent),
                      ]),
                )),
            Container(
              height: 260,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 1),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontFamily: 'popins',
                            color: Colors.white,
                            fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 25.0),
                    child: Container(
                      height: 70,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(134, 175, 238, 194),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            '25',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(),
                          Text(
                            '0.625',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Positioned(
                top: 80,
                left: 20,
                width: 100,
                height: 100,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                )),
          ],
        ),
      ),
    );
  }
}
