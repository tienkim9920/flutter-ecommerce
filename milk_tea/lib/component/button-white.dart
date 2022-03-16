import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ButtonIconWhite extends StatelessWidget {

  final double paddingTop;
  final double paddingBottom;
  final String text;
  final String itemId;
  final Function excutiveEvent;
  final IconData icon;
  final bool widthHorizontal;

  const ButtonIconWhite(this.paddingTop, this.paddingBottom, this.text, this.itemId, this.excutiveEvent, 
  this.icon, this.widthHorizontal, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widthHorizontal ? MediaQuery.of(context).size.width : null,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
            child: SizedBox(
              width: 110,
              height: 40,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                    )
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0))
                ),
                onPressed: () => excutiveEvent(itemId),
                label: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                  color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                  fontSize: 16
                  ),
                ),
                icon: Icon(icon, color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1)),
              )              
            )
          ),
        )
      ],
    );
  }
}