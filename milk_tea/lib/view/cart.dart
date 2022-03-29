import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:milk_tea/component/button-white.dart';
import 'package:milk_tea/component/custom-product.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Cart extends StatelessWidget {
  final List<dynamic> carts;
  final Function productId;
  final Function upCount;
  final Function downCount;
  final String total;
  final Function onDelete;
  final Function onViewDetail;

  const Cart(this.carts, this.productId, this.upCount, this.downCount,
      this.total, this.onDelete, this.onViewDetail,
      {Key? key})
      : super(key: key);

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
                    ...carts.map((item) => Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: CustomProduct(
                                item['product'],
                                (id) => productId(id),
                                true,
                                item['id'].toString(),
                                'Kích cỡ: ${item['size']}',
                                item['count'].toString(),
                                (up) => upCount(up),
                                (down) => downCount(down)),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Xem',
                                color: Color.fromRGBO(CustomColor().R,
                                    CustomColor().G, CustomColor().B, 1),
                                icon: Icons.more_horiz,
                                onTap: () =>
                                    onViewDetail(item['product']['id']),
                              ),
                              IconSlideAction(
                                caption: 'Xóa',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () => onDelete(item['id']),
                              ),
                            ],
                          ),
                        )),
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
                        color: Color.fromRGBO(CustomColor().R, CustomColor().G,
                            CustomColor().B, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextLabel(true, true, false, false, false, total,
                                  24, false, 0),
                              Container(
                                child: ButtonIconWhite(
                                    0,
                                    0,
                                    'Mua',
                                    'id',
                                    (id) => {productId(id)},
                                    Icons.shopping_cart,
                                    false),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ]));
  }
}
