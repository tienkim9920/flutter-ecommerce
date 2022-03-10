import 'package:flutter/material.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ButtonIcon(10, 10, 'Đăng Nhập với Facebook', CustomColor(4, 118, 78, 1), () => print("Click Me"), Icons.mail),
        ],
      ),
    );
  }
}