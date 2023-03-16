import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:project_new/Authentication/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:google_fonts/google_fonts.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const RiveAnimation.asset("assets/circlesscreen.riv"
          , fit: BoxFit.fill,),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: 321,
                  child: Column(
                    children: const [
                      Text(
                        "Customize Your Documents",
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Inter",
                            height: 1.5,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Start Customizing your documents according to your needs .All your customization at one place",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "inter",
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                SizedBox(
                  height: 50,
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.white, // background
                        foregroundColor: Colors.black, // foreground
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,

                          builder: (BuildContext context) => Center(
                            child: Container(
                              height: 630,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 30),
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(
                                    255, 255, 255, 0.9921568627450981),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Scaffold(
                                resizeToAvoidBottomInset: true,
                                backgroundColor:
                                     const Color.fromRGBO(250, 250, 250, 1.0),
                                body: Column(
                                  children: [

                                    Text(
                                      "Get Access to Hundreds of options to  Customizing your document at single place ",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 20,
                                      )),
                                    ),
                                    Text("Welcome",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 34,
                                              fontFamily: "Poppins"),
                                        )),            Lottie.asset(
                                      'assets/welcomescreenanimation.json',
                                      repeat: true,
                                      reverse: true,
                                      animate: true,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 250,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.blue,

                                          ),
                                          onPressed: (){
                                            final provider =Provider.of<GoogleSignProvider>(context, listen:false);
                                            provider.googleLogin();
                                            Navigator.pop(context);
                                          },
                                          icon: FaIcon(FontAwesomeIcons.google),
                                          label:  const Text('Login With Google')),

                                    ),
                                    const SizedBox(
                                      height: 30,
                                      width: 0,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 250,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.red,
                                          ),
                                          onPressed: onPressed,
                                          child: Text('Login With Mobile')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Get Started',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                 fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(183, 150, 243, 1.0),
                            ))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
