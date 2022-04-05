import 'package:flutter/material.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class ButtonCustom extends StatelessWidget {
  final String textLabel;
  final Function excutive;
  final double width;

  const ButtonCustom(this.textLabel, this.excutive, this.width, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width == 0 ? MediaQuery.of(context).size.width : width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color.fromRGBO(
                CustomColor().R, CustomColor().G, CustomColor().B, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabel(false, true, false, false, false, textLabel, 17, false, 1)
          ],
        ),
      ),
      onTap: () => excutive(),
    );
  }
}
