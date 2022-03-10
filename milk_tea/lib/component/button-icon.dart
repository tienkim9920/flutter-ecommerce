import 'package:flutter/material.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ButtonIcon extends StatelessWidget {

  final double paddingTop;
  final double paddingBottom;
  final String text;
  final CustomColor color;
  final Function excutiveEvent;
  final IconData icon;

  const ButtonIcon(this.paddingTop, this.paddingBottom, this.text, this.color, this.excutiveEvent, this.icon, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, paddingTop, 30, paddingBottom),
            child: SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(color.R, color.G, color.B, color.O)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                      // side: BorderSide(color: Colors.red)
                    )
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0))
                ),
                onPressed: () => excutiveEvent(),
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