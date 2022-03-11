import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;
  final Function onPassword;

  const InputSearch(this.inputText, this.placeHolder, this.onPassword, {Key? key}) : super(key: key);

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
                    filled: true,
                    fillColor: Color.fromRGBO(250, 250, 250, 1),
                    hoverColor: Color.fromRGBO(250, 250, 250, 1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        width: .5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        width: .5)),
                    hintStyle:
                      GoogleFonts.quicksand(color: Color.fromRGBO(150, 150, 150, 1)),
                      hintText: placeHolder,
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => onPassword(inputText.text),
                        child: Icon(Icons.search, color: Color.fromRGBO(150, 150, 150, 1)),
                      ),
                    ),  
                ),
              )),
          )
        ),
      ],
    );
  }
}
