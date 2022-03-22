import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/text-error.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;
  final bool isPassword;
  final Function onPassword;
  final String messError;
  final bool validate;

  const InputPassword(this.inputText, this.placeHolder, this.isPassword,
      this.onPassword, this.messError, this.validate,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
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
                              color: validate
                                  ? Colors.red
                                  : Color.fromRGBO(235, 235, 235, 1),
                              width: .9)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(4, 118, 78, 1),
                              width: 2.0)),
                      labelStyle: GoogleFonts.quicksand(
                          color: Color.fromRGBO(150, 150, 150, 1)),
                      labelText: placeHolder,
                      suffixIcon: GestureDetector(
                        onTap: () => onPassword(),
                        child: Icon(
                            isPassword
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            size: 22,
                            color: Color.fromRGBO(4, 118, 78, 1)),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
      if (validate) ...[TextError(messError)]
    ]);
  }
}
