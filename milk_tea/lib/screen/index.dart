import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/menu-widget.dart';
import 'package:milk_tea/component/menu.dart';
import 'package:milk_tea/models/menu-item.dart';
import 'package:milk_tea/view/cart.dart';
import 'package:milk_tea/view/history.dart';
import 'package:milk_tea/view/home.dart';
import 'package:milk_tea/view/product.dart';
import 'package:milk_tea/view/profile.dart';

class Index extends StatefulWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String currentItem = 'trangchu';
  String currentScreen = 'Trang Chủ';

  List<MenuItem> menuItems = [
    MenuItem('trangchu', 'Trang chủ', Icons.home),
    MenuItem('sanpham', 'Sản phẩm', Icons.shopping_cart),
    MenuItem('giohang', 'Giỏ hàng', Icons.shopping_bag),
    MenuItem('hoso', 'Hồ sơ', Icons.person),
    MenuItem('lichsu', 'Lịch sử', Icons.menu_book),
  ];

  dynamic getScreen(){
    switch(currentItem){
      case 'trangchu':
        return Home();
      case 'sanpham':
        return Product();
      case 'giohang':
        return Cart();
      case 'hoso':
        return Profile();
      case 'lichsu':
        return History();
    }
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    style: DrawerStyle.Style1,
    borderRadius: 20,
    angle: -5,
    slideWidth: MediaQuery.of(context).size.width * .75,
    showShadow: true,
    backgroundColor: Color.fromRGBO(4, 118, 78, 0.7),
    menuScreen: Builder(
      builder: (context) => Menu(currentItem, menuItems, (item) => {
        setState(() => {
          currentItem = item.id,
          currentScreen = item.title
        }),
        ZoomDrawer.of(context)!.close(),
      }),
    ),
    mainScreen: Scaffold(
      appBar: AppBar(
        title: Text(currentScreen, 
          style: GoogleFonts.quicksand()),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: MenuWidget()
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: getScreen(),
      ),
    )
  );
}