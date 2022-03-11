import 'package:flutter/material.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Home extends StatelessWidget {

  final Function productId;

  const Home(this.productId, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ButtonIcon(10, 10, 'Đăng Nhập với Facebook', CustomColor(4, 118, 78, 1), () => print("Click Me"), Icons.mail),
          TextButton(
            onPressed: () => { productId('123') }, 
            child: Text("Go to detail")
          )
        ],
      ),
    );
  }
}