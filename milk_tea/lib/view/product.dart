import 'package:flutter/material.dart';
import 'package:milk_tea/models/product.model.dart';

class Product extends StatelessWidget {

  final List<ProductModel> products;
  final Function productId;

  const Product(this.products, this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () => { productId('123') }, 
            child: Text("Go to detail")
          )
        ],
      ),
    );
  }
}
