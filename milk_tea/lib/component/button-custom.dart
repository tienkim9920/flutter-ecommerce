import 'package:flutter/material.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ButtonCustom extends StatelessWidget {

  final String textLabel;
  final Function excutive;

  const ButtonCustom(this.textLabel, this.excutive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color.fromRGBO(
                CustomColor().R, CustomColor().G, CustomColor().B, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabel(false, true, false, false, false, textLabel, 17,
                false, 1)
          ],
        ),
      ),
      onTap: () => excutive(),
    );
  }
}
