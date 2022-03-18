import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;
  final bool isPassword;
  final Function onPassword;

  const InputPassword(this.inputText, this.placeHolder, this.isPassword, this.onPassword, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: inputText,
                  obscureText: isPassword,
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
                      labelText: placeHolder,
                    suffixIcon: GestureDetector(
                      onTap: () => onPassword(),
                      child: Icon(
                        isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
                        size: 22, color: Color.fromRGBO(4, 118, 78, 1)),
                    ),
                  ),  
                ),
              )),
        ),
      ],
    );
  }
}
