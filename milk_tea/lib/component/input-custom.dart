import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCustom extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;
  final double sizeWidth;

  const InputCustom(this.inputText, this.placeHolder, this.sizeWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: sizeWidth,
          child: Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  style: GoogleFonts.quicksand(),
                  controller: inputText,
                  cursorColor: Color.fromRGBO(4, 118, 78, 1),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(235, 235, 235, 1),
                              width: .9)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(4, 118, 78, 1),
                              width: 2.0,)),
                      labelStyle:
                          GoogleFonts.quicksand(color: Color.fromRGBO(150, 150, 150, 1)),
                      labelText: placeHolder,
                    ),
                ),
              )),
        ),
      ],
    );
  }
}
