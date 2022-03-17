import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class TextLabel extends StatelessWidget {

  final bool textCurrency;
  final bool textWhite;
  final bool textGreen;
  final bool textDark;
  final bool textGrey;
  final String textLabel;
  final double fontSize;
  final bool fontWeight;
  final int textMove;

  const TextLabel(this.textCurrency, this.textWhite, this.textGreen, this.textDark, 
    this.textGrey, this.textLabel, this.fontSize, this.fontWeight, this.textMove, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textCurrency ? '${NumberFormat.decimalPattern().format(int.parse(textLabel))} VNĐ' : textLabel,
      textAlign: textMove == 0 ? TextAlign.start : textMove == 1 ? TextAlign.center : textMove == 2 ? TextAlign.end : null,
      style: GoogleFonts.quicksand(
        color: textWhite ? Colors.white : textGreen ? Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1) :
          textDark ? Color.fromRGBO(20, 20, 20, 1) : Colors.grey,
        fontSize: fontSize,
        fontWeight: fontWeight ? FontWeight.w500 : null
      ),
    );
  }
}