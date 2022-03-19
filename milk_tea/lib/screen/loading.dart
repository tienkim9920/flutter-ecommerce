import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/constant/route.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () =>
      Navigator.pushReplacementNamed(context, Routes().signin)
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/logo.png', width: 150, height: 100),
                  Text(
                    'Ombee',
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          )
          
        ]
      ),
    );
  }
}