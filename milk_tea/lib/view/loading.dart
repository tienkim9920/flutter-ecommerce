import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/logo_color.png', width: 150, height: 100),
                Text(
                  'Ombee',
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(CustomColor().R,
                              CustomColor().G, CustomColor().B, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
