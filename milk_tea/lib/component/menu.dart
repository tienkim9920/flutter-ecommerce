import 'package:flutter/material.dart';
import 'package:milk_tea/models/menu-item.dart';

class Menu extends StatelessWidget {
  final String currentItem;
  final List<MenuItem> menuItems;
  final ValueChanged<MenuItem> onSelectItem;

  const Menu(this.currentItem, this.menuItems, this.onSelectItem, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset('assets/logo_color.png', width: 80, height: 40),
                ),
                Expanded(
                  child: Text(
                    'Milk Tea', 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  onTap: () => onSelectItem(item),
                )).toList(),
              ],
            )
          ],
        ),
      )
    );
  }
}