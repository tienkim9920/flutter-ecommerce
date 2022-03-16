import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  
  final bool showLeft;
  final bool showCenter;
  final bool showRight;
  final bool bgColor;
  final String contentCenter;
  final String contentRight;
  final Function backStep;
  final Function nextStep;

  const Navbar(this.showLeft, this.showCenter, this.showRight, this.bgColor, this.contentCenter, 
  this.contentRight, this.backStep, this.nextStep, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ? Colors.white : null,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showLeft) ...[
            MouseRegion(
            cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset('assets/back-arrow.png', width: 40, height: 40),
                onTap: () => backStep(),
            ),
          )],
          if (showCenter) ...[
            Text(contentCenter, style: GoogleFonts.quicksand(
            fontSize: 19,
            color: bgColor ? Color.fromRGBO(20, 20, 20, 0.7) : Colors.white
          ))],
          if (showRight) ...[
            MouseRegion(
            cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset('assets/${contentRight}', width: 30, height: 30),
                onTap: () => nextStep(),
            ),
          )],
        ],
      ),
    );
  }
}