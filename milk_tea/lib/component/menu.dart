import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:milk_tea/models/menu-item.dart';
import 'package:milk_tea/route/route.dart';

List<MenuItem> menuItems = [
  MenuItem('trangchu', 'Trang chủ', Icons.home, Routes().home),
  MenuItem('giohang', 'Giỏ hàng', Icons.shopping_bag, '/giohang'),
  MenuItem('sanpham', 'Sản phẩm', Icons.shopping_cart, Routes().product),
  MenuItem('hoso', 'Hồ sơ', Icons.person, '/giohang'),
  MenuItem('lichsu', 'Lịch sử', Icons.menu_book, '/giohang'),
];

class Menu extends StatelessWidget {
  final String currentItem;

  const Menu(this.currentItem, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            ...menuItems.map((item) => ListTile(
              selected: item.id == currentItem,
              minLeadingWidth: 20,
              leading: Icon(
                item.icon,
                color: item.id == currentItem ? Color.fromRGBO(4, 118, 78, 1) : 
                Color.fromRGBO(180, 180, 180, 1)
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  color: item.id == currentItem ? Color.fromRGBO(4, 118, 78, 1) : 
                  Color.fromRGBO(180, 180, 180, 1)
                ),
              ),
              onTap: () => {
                ZoomDrawer.of(context)!.close(),
                Navigator.pushNamed(context, item.route)
              },
            )).toList(),
            Spacer(flex: 2),
            Text(currentItem)
          ],
        ),
      )
    );
  }
}