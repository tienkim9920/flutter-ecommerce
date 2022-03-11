import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/search.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/category-item.dart';

class Product extends StatelessWidget {

  final List<CategoryItem> categoryItem;
  final String currentCategoryItem;
  final Function onCategoryItem;
  final TextEditingController inputSearch;
  final Function onInputSearch;
  final List<ProductModel> products;
  final Function productId;

  const Product(this.categoryItem, this.currentCategoryItem, this.onCategoryItem, this.inputSearch, this.onInputSearch, 
    this.products, this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 10.0),
          InputSearch(inputSearch, 'Tìm kiếm sản phẩm', (text) => onInputSearch(text)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 30.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: [
                ...categoryItem.map((e) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => onCategoryItem(e.id),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: e.id == currentCategoryItem ? BorderSide(width: 2.0, color: Color.fromRGBO(4, 118, 78, 1)) : 
                          BorderSide(width: .5, color: Color.fromRGBO(230, 230, 230, 1))
                        )
                      ),
                      width: 125.0,
                      child: Text(e.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          color: e.id == currentCategoryItem ? Color.fromRGBO(4, 118, 78, 1) : Color.fromRGBO(200, 200, 200, 1),
                          fontSize: 18
                        )),
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * .7796,
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child: Column(
          //       children: [
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 140.0,
          //         child: Row(
          //           children: [
          //             Column(
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Positioned(
          //                       child: Image.asset('assets/bakery.png', width: 100, height: 100,),
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //             Column(
          //               children: [

          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
          TextButton(
            onPressed: () => { productId('123') }, 
            child: Text("Go to detail")
          )
          // )
        ],
      ),
    );
  }
}
