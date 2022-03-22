import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class TextError extends StatelessWidget {
  final String textLabel;

  const TextError(this.textLabel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(40, 5, 40, 0),
        child: Text(
          textLabel,
          textAlign: TextAlign.start,
          style: GoogleFonts.quicksand(
            color: Colors.red[500],
            fontSize: 14,
          ),
        ),
      ),
    ]);
  }
}
