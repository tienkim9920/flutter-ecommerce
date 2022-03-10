import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/pattern/menu-item.dart';

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
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo_color.png', width: 50, height: 40),
                  Text(
                    'Milk Tea', 
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Row(
                children: [
                  Text('Main Menus',
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 18
                    )
                  )
                ]
              ),
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
                    style: GoogleFonts.quicksand(
                      color: item.id == currentItem ? Color.fromRGBO(4, 118, 78, 1) : 
                      Color.fromRGBO(180, 180, 180, 1)
                    ),
                  ),
                  onTap: () => onSelectItem(item),
                )).toList(),
                SizedBox(height: 30),
                ListTile(
                  minLeadingWidth: 20,
                  leading: Image.asset('assets/logout.png'),
                  title: Text('Đăng xuất',
                    style: GoogleFonts.quicksand(
                      color: Color.fromRGBO(180, 180, 180, 1) 
                    )
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Milk Tea Coffee',
                        style: GoogleFonts.quicksand(
                          color: Color.fromRGBO(180, 180, 180, 1),
                          fontSize: 16
                        )
                      )
                    ]
                  ),
                  Row(
                    children: [
                      Text('HUFLIT',
                        style: GoogleFonts.quicksand(
                          color: Color.fromRGBO(200, 200, 200, 1),
                          fontSize: 13
                        )
                      )
                    ]
                  ),
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}