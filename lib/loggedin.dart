import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_new/feature_screen.dart';

class LoggedIn extends StatefulWidget {
  @override
  State<LoggedIn> createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return FeatureScreen();
      }
      final imageTemporary = File(image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to Pick Image $e');
    }
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.blue),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text("page 1"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeatureScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.train),
                title: const Text("Page 2"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                borderRadius: BorderRadius.circular(100)),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL!),
                              radius: 40,
                              // backgroundImage: NetworkImage(user.photoURL!),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Welcome!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 10,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 35, horizontal: 20),
                            child: Text(
                              'Select File',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 25),
                            ),
                          ),
                          Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: const Icon(Icons.camera_alt,
                                        size: 30, color: Colors.blueAccent),
                                    onTap: () {
                                      getImage(ImageSource.camera);
                                    },
                                  ),
                                  VerticalDivider(),
                                  GestureDetector(
                                    child: Icon(Icons.image,
                                        size: 30, color: Colors.blueAccent),
                                    onTap: () {
                                      getImage(ImageSource.gallery);
                                    },
                                  ),
                                ]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 10),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: 320,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              color: Color.fromARGB(255, 209, 208, 208),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, left: 5),
                                    child: Text(
                                      'RECENT',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.recent_actors),
                label: 'Recent',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.pan_tool_sharp),
                label: 'Tools',
                backgroundColor: Colors.blue),
          ],
        ),
      ),
    );
  }
}
