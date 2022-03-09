import 'package:flutter/material.dart';
import 'package:milk_tea/constant/route.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () =>
      Navigator.pushReplacementNamed(context, Routes().intro)
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Screen Loading'),
    );
  }
}