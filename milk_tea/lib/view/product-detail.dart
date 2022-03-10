import 'package:flutter/material.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/constant/name-component.dart';
import 'package:milk_tea/models/product.model.dart';

class ProductDetail extends StatelessWidget {

  final ProductModel product;
  final Function backStep;

  const ProductDetail(this.product, this.backStep,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(true, true, true, false, 'Chi tiết sản phẩm', 'flag.png', () => backStep(IDComponent().sanpham, NameComponent().sanpham)),
        Text("Component Product ${product.id}")
      ],
    );
  }
}