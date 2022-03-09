import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/menu-widget.dart';
import 'package:milk_tea/component/menu.dart';
import 'package:milk_tea/constant/name-component.dart';
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
  String currentItem = IDComponent().trangchu;
  String currentScreen = NameComponent().trangchu;

  List<MenuItem> menuItems = [
    MenuItem(IDComponent().trangchu, NameComponent().trangchu, Icons.home),
    MenuItem(IDComponent().sanpham, NameComponent().sanpham, Icons.shopping_cart),
    MenuItem(IDComponent().giohang, NameComponent().giohang, Icons.shopping_bag),
    MenuItem(IDComponent().hoso, NameComponent().hoso, Icons.person),
    MenuItem(IDComponent().lichsu, NameComponent().lichsu, Icons.menu_book),
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

  void updateCurrentItem(String id, String name){
    setState(() => {
      currentItem = id,
      currentScreen = name
    });
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    style: DrawerStyle.Style1,
    borderRadius: 20,
    angle: -7,
    slideWidth: MediaQuery.of(context).size.width * .73,
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
          style: GoogleFonts.quicksand(
            color: Color.fromRGBO(20, 20, 20, 0.7)
          ),
        ),
        centerTitle: true,
        leading: MenuWidget(),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Image.asset('assets/buy.png'),
            onPressed: () => updateCurrentItem(IDComponent().giohang, NameComponent().giohang),
          )
        ],
      ),
      body: getScreen(),
    )
  );
}