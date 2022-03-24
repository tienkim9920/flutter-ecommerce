import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button-icon.dart';
import 'package:milk_tea/component/custom-product.dart';
import 'package:milk_tea/component/search.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/category-item.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Product extends StatelessWidget {
  final List<dynamic> categoryItem;
  final String currentCategoryItem;
  final Function onCategoryItem;
  final TextEditingController inputSearch;
  final Function onInputSearch;
  final List<dynamic> products;
  final Function productId;

  const Product(
      this.categoryItem,
      this.currentCategoryItem,
      this.onCategoryItem,
      this.inputSearch,
      this.onInputSearch,
      this.products,
      this.productId,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 10.0),
          InputSearch(
              inputSearch, 'Tìm kiếm sản phẩm', (text) => onInputSearch(text)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 30.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: [
                ...categoryItem
                    .map((e) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onCategoryItem(e['id']),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: e['id'].toString() ==
                                              currentCategoryItem.toString()
                                          ? BorderSide(
                                              width: 2.0,
                                              color:
                                                  Color.fromRGBO(4, 118, 78, 1))
                                          : BorderSide(
                                              width: .5,
                                              color: Color.fromRGBO(
                                                  230, 230, 230, 1)))),
                              width: 125.0,
                              child: Text(e['name'],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      color: e['id'].toString() ==
                                              currentCategoryItem.toString()
                                          ? Color.fromRGBO(4, 118, 78, 1)
                                          : Color.fromRGBO(200, 200, 200, 1),
                                      fontSize: 18)),
                            ),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * .7796,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (currentCategoryItem == '0') ...[
                      ...products.map((e) => CustomProduct(
                          e, (id) => productId(id.toString()), false))
                    ] else ...[
                      ...products
                          .where((item) =>
                              item['productCategoryId'].toString() ==
                              currentCategoryItem.toString())
                          .map((e) => CustomProduct(
                              e, (id) => productId(id.toString()), false))
                          .toList()
                    ]
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
