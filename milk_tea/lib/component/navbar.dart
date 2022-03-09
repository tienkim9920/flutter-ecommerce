import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  
  final bool showLeft;
  final bool showCenter;
  final bool showRight;
  final bool bgColor;
  final String contentCenter;
  final String contentRight;

  const Navbar(this.showLeft, this.showCenter, this.showRight, this.bgColor, this.contentCenter, this.contentRight, { Key? key }) : super(key: key);

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
                child: Image.asset('assets/back-arrow.png', width: 35, height: 35),
                onTap: () {},
            ),
          )],
          if (showCenter) ...[
            Text(contentCenter, style: GoogleFonts.quicksand(
            fontSize: 19,
            color: Color.fromRGBO(20, 20, 20, 0.7)
          ))],
          if (showRight) ...[
            MouseRegion(
            cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset('assets/${contentRight}', width: 22, height: 22),
                onTap: () {},
            ),
          )],
        ],
      ),
    );
  }
}