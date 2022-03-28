import 'package:flutter/material.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Button extends StatelessWidget {
  final double paddingTop;
  final double paddingBottom;
  final String text;
  final CustomColor color;
  final Function excutiveEvent;

  const Button(this.paddingTop, this.paddingBottom, this.text, this.color,
      this.excutiveEvent,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: EdgeInsets.fromLTRB(40, paddingTop, 40, paddingBottom),
              child: SizedBox(
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(color.R, color.G, color.B, color.O)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)
                                    // side: BorderSide(color: Colors.red)
                                    )),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0))),
                    onPressed: () => excutiveEvent(),
                    child: TextLabel(
                        false, true, false, false, false, text, 17, false, 1),
                  ))),
        )
      ],
    );
  }
}
