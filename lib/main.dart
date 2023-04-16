import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_new/Authentication/google_sign_in.dart';
import 'package:project_new/Authentication/homepage.dart';
import 'package:provider/provider.dart';

import 'edit_option_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "Manpage";

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Homepage(),
        ),
      );
}
