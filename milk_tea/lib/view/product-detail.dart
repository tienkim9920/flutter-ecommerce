import 'package:flutter/material.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/current-parent.dart';

class ProductDetail extends StatelessWidget {

  final ProductModel product;
  final Function backStep;
  final CurrentParent currentParent;

  const ProductDetail(this.product, this.backStep, this.currentParent, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(true, true, true, false, 'Chi tiết sản phẩm', 'flag.png', () => backStep(currentParent.id, currentParent.name)),
        Text("Component Product ${product.id}")
      ],
    );
  }
}