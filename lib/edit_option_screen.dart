import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // iphone14promax23Cac (186:32)
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(18 * fem, 24 * fem, 31.5 * fem, 26 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff604aea),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // vectorSUx (238:300)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 136.5 * fem, 8 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: SizedBox(
                        width: 22.5 * fem,
                        height: 12 * fem,
                      ),
                    ),
                  ),
                  Container(
                    // toolswAp (198:49)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 15.5 * fem, 0 * fem),
                    child: Text(
                      'Tools',
                      style: GoogleFonts.poppins(
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // dotsverticalFBW (198:51)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 0 * fem),
                    width: 1 * fem,
                    height: 1 * fem,
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(33 * fem, 86 * fem, 34 * fem, 29 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupx64ygXi (NhKiosbS7rYZFV4zQgx64Y)
                    margin: EdgeInsets.fromLTRB(
                        4 * fem, 0 * fem, 2 * fem, 28 * fem),
                    width: double.infinity,
                    height: 321 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // ellipse11Ckx (265:39)
                          left: 23 * fem,
                          top: 3 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 300 * fem,
                              height: 285 * fem,
                              child: Lottie.asset(
                                '95947-loading-animation.json',
                                width: 30 * fem,
                                height: 285 * fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupqbgcQME (NhKixxAe3sbxvV742zqbGC)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 3 * fem, 25 * fem),
                    width: 360 * fem,
                    height: 115 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle16Kyz (186:37)
                          left: 0 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 360 * fem,
                              height: 113 * fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                    gradient: const LinearGradient(
                                      begin: Alignment(-0.451, -1),
                                      end: Alignment(1.196, -1),
                                      colors: <Color>[
                                        Color(0xffa692fb),
                                        Color(0x00381cae)
                                      ],
                                      stops: <double>[0, 1],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // convert9CL (186:38)
                          left: 38 * fem,
                          top: 20 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 97 * fem,
                              height: 27 * fem,
                              child: Text(
                                'Convert  ',
                                style: GoogleFonts.poppins(
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // allselectedimagewillbeconveted (186:39)
                          left: 25 * fem,
                          top: 68 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 318 * fem,
                              height: 14 * fem,
                              child: Text(
                                'All Selected Image Will be  Conveted in Different File Format ',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // 6Fz (186:44)
                          left: 17 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 12 * fem,
                              height: 44 * fem,
                              child: Text(
                                '.',
                                style: GoogleFonts.poppins(
                                  fontSize: 36 * ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupcjacaS4 (NhKj7s5TQyS1QfFTpDcJAc)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 3 * fem, 20 * fem),
                    padding: EdgeInsets.fromLTRB(
                        17 * fem, 0 * fem, 17 * fem, 37 * fem),
                    width: 360 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff80aef2),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupr2mw46L (NhKjEhDQgbsz4WmDWqR2MW)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 240 * fem, 15 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // aaU (186:45)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 11 * fem, 4 * fem),
                                child: Text(
                                  '.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 36 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2125 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Text(
                                // cropsZa (186:35)
                                'Crop  ',
                                style: GoogleFonts.poppins(
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // allselectedimagewillberesizedc (186:40)
                          margin: EdgeInsets.fromLTRB(
                              8 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'All Selected Image Will be  Resized',
                            style: GoogleFonts.poppins(
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroup87dri4Q (NhKjQwRLb3Yx3J2r4m87dr)
                    margin:
                        EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 360 * fem,
                    height: 114 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // resizeimagepdE (186:36)
                          left: 59 * fem,
                          top: 14 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 147 * fem,
                              height: 27 * fem,
                              child: Text(
                                'Resize Image ',
                                style: GoogleFonts.poppins(
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle15KK6 (186:41)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 360 * fem,
                              height: 114 * fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                    color: const Color(0xff81d2d6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // cJC (186:66)
                          left: 17 * fem,
                          top: 2 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 12 * fem,
                              height: 44 * fem,
                              child: Text(
                                '.',
                                style: GoogleFonts.poppins(
                                  fontSize: 36 * ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // compress7kk (186:47)
                          left: 40 * fem,
                          top: 23 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 120 * fem,
                              height: 27 * fem,
                              child: Text(
                                'Compress  ',
                                style: GoogleFonts.poppins(
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30 * fem,
                          top: 68 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 211 * fem,
                              height: 14 * fem,
                              child: Text(
                                'All Selected Image Will be  Compressed',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
