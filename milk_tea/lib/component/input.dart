import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;

  const Input(this.inputText, this.placeHolder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: inputText,
                  cursorColor: Color.fromRGBO(4, 118, 78, 1),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              width: 1.0)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(4, 118, 78, 1),
                              width: 2.0)),
                      labelStyle:
                          GoogleFonts.quicksand(color: Color.fromRGBO(150, 150, 150, 1)),
                      labelText: placeHolder
                    ),
                ),
              )),
        ),
      ],
    );
  }
}
