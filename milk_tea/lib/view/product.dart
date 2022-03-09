import 'package:flutter/material.dart';
import 'package:milk_tea/component/menu-widget.dart';

class Product extends StatelessWidget {
  const Product({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Screen Product'),
          TextButton(
            onPressed: () => MenuWidget(), 
            child: Text('Navigation Open')
          )
        ]
      ),
    );
  }
}