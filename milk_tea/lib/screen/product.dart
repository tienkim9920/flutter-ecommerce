import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:milk_tea/component/menu.dart';
import 'package:milk_tea/component/menu-widget.dart';
import 'package:milk_tea/screen/home.dart';

class Product extends StatefulWidget {
  const Product({ Key? key }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String currentItem = 'sanpham';

    dynamic getScreen(){
    switch(currentItem){
      case 'trangchu':
        return Home();
      case 'sanpham':
        return Product();
    }
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    style: DrawerStyle.Style1,
    menuScreen: Menu(currentItem), 
    mainScreen: Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: MenuWidget(),
      ),
      body: Text('Screen Product'),
    )
  );
}