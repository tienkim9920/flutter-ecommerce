import 'dart:math';
import 'package:flutter/material.dart';
import 'package:milk_tea/models/menu-item.dart';
import 'package:milk_tea/screen/home.dart';
import 'package:milk_tea/screen/product.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  double value = 0;
  double xPosition = 1;

  String currentItem = 'trangchu';
  List<MenuItem> menuItems = [
    MenuItem('trangchu', 'Trang chủ', Icons.home),
    MenuItem('sanpham', 'Sản phẩm', Icons.shopping_cart),
  ];

  dynamic getScreen() {
    switch (currentItem) {
      case 'trangchu':
        return Home();
      case 'sanpham':
        return Product();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            width: 200.0,
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              Expanded(
                child: ListView(
                  children: menuItems
                      .map((item) => ListTile(
                            selected: item.title == currentItem,
                            onTap: () => print("123213123213"),
                            leading: Icon(item.icon,
                                color: item.id == currentItem
                                    ? Color.fromRGBO(4, 118, 78, 1)
                                    : Color.fromRGBO(180, 180, 180, 1)),
                            title: Text(
                              item.title,
                              style: TextStyle(
                                  color: item.id == currentItem
                                      ? Color.fromRGBO(4, 118, 78, 1)
                                      : Color.fromRGBO(180, 180, 180, 1)),
                            ),
                          ))
                      .toList(),
                ),
              )
            ]),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 300),
              builder: (_, double val, __) {
                return (Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 300 * val)
                    ..rotateY((pi / 6) * val),
                  child: getScreen(),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0){
                setState(() {
                  print(e.delta.dx);
                  value = 1;
                });
              }else {
                setState(() {
                  value = 0;
                  print(e.delta.dx);
                });
              }
            },
          )
        ],
      ),
    );
  }
}
