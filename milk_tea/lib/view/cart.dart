import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/button-white.dart';
import 'package:milk_tea/component/custom-product.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Cart extends StatelessWidget {

  final Function productId;
  
  const Cart(this.productId, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // clipBehavior: Clip.none,
        children: [
          Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: CustomProduct((id) => productId(id), true),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Xem',
                      color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                      icon: Icons.more_horiz,
                      onTap: () => print('Xem'),
                    ),
                    IconSlideAction(
                      caption: 'Xóa',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => print('Xóa'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 700,
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 330,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text('${NumberFormat.decimalPattern().format(70000)} VNĐ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: ButtonIconWhite(0, 0, 'Mua', 'id',
                        (id) => { productId(id) }, Icons.shopping_cart, false),
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        )
      ])  
    );
  }
}