import 'package:flutter/material.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ButtonIcon extends StatelessWidget {

  final double paddingTop;
  final double paddingBottom;
  final String text;
  final CustomColor color;
  final String itemId;
  final Function excutiveEvent;
  final IconData icon;
  final bool widthHorizontal;

  const ButtonIcon(this.paddingTop, this.paddingBottom, this.text, this.color, this.itemId, this.excutiveEvent, 
  this.icon, this.widthHorizontal, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widthHorizontal ? MediaQuery.of(context).size.width : null,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, paddingTop, 30, paddingBottom),
            child: SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(color.R, color.G, color.B, color.O)),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                    )
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0))
                ),
                onPressed: () => excutiveEvent(itemId),
                label: Text(text),
                icon: Icon(icon),
              )              
            )
          ),
        )
      ],
    );
  }
}