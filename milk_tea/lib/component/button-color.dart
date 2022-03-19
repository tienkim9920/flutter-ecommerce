import 'package:flutter/material.dart';
import 'package:milk_tea/component/text-label.dart';

class ButtonColor extends StatelessWidget {

  final String textLabel;
  final Function excutive;
  final int R;
  final int G;
  final int B;

  const ButtonColor(this.textLabel, this.R, this.G, this.B, this.excutive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color.fromRGBO(R, G, B, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabel(false, false, false, true, false, textLabel, 17,
                false, 1)
          ],
        ),
      ),
      onTap: () => excutive(),
    );
  }
}
