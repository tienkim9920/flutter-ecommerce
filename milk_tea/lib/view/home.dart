import 'package:flutter/material.dart';
import 'package:milk_tea/component/menu-widget.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Screen Home'),
          TextButton(
            onPressed: () => MenuWidget(), 
            child: Text('Navigation Open')
          )
        ]
      ),
    );
  }
}