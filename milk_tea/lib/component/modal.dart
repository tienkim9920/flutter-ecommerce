import 'package:flutter/material.dart';
import 'package:milk_tea/component/button-custom.dart';
import 'package:milk_tea/component/text-label.dart';

class Modal extends StatelessWidget {
  final String textMain;
  final String textButton;
  final Function excutive;

  const Modal(this.textMain, this.textButton, this.excutive, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 844,
      color: Colors.black.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/bg-white-2.png'),
              fit: BoxFit.fill,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextLabel(
                    false, false, false, true, false, textMain, 22, false, 1),
                SizedBox(height: 30),
                ButtonCustom(textButton, () => excutive(), 0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
