import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_new/View/compression_screen.dart';
import 'package:project_new/View/converter_screen.dart';
import 'package:project_new/View/cropping_screen.dart';


class FeatureScreen extends StatelessWidget {
  final File? image;

  const FeatureScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: Text('Tools'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            width: 500,
          ),
          Stack(
            children: [
              CircleAvatar(
                maxRadius: 100,
                child: Lottie.asset(
                  'assets/95947-loading-animation.json',
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {

              Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) => CroppingScreen(
                      image: image!, title: '',
                    )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment(-0.451, -1),
                  end: Alignment(1.196, -1),
                  colors: const <Color>[Color(0xffa692fb), Color(0x00381cae)],
                  stops: const <double>[0, 1],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.crop),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "Let's Crop",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                      Text(
                        "Crop your images according to needs",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) => CompressionScreen(
                          image: image!,
                        )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment(-0.451, -1),
                  end: Alignment(1.196, -1),
                  colors: const <Color>[Color(0xff80aef2), Color(0x00381cae)],
                  stops: const <double>[0, 1],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.compress),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "Let's compress",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                      Text(
                        "Compress according to required size",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {

              Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) => ConverterScreen(
                      image: image!,
                    )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment(-0.451, -1),
                  end: Alignment(1.196, -1),
                  colors: const <Color>[Color(0xff81d2d6), Color(0x00381cae)],
                  stops: const <double>[0, 1],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.track_changes),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "Let's Convert",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                      Text(
                        "Many formats are in option",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
