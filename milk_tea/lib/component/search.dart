import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/service/product.service.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController inputText;
  final String placeHolder;
  final Function onInputSearch;
  final Function onRedirectProduct;

  const InputSearch(
      this.inputText, this.placeHolder, this.onInputSearch, this.onRedirectProduct,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: inputText,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(250, 250, 250, 1),
                    hoverColor: Color.fromRGBO(250, 250, 250, 1),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: .5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: .5)),
                    hintStyle: GoogleFonts.quicksand(
                        color: Color.fromRGBO(150, 150, 150, 1)),
                    hintText: placeHolder,
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => onInputSearch(inputText.text),
                        child: Icon(Icons.search,
                            color: Color.fromRGBO(150, 150, 150, 1)),
                      ),
                    )),
              ),
              suggestionsCallback: (pattern) {
                return ServiceProduct().getSearchProducts(pattern);
              },
              itemBuilder: (context, dynamic suggestion) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.network(suggestion['image'], width: 50, height: 50),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLabel(false, false, false, true, false,
                            suggestion['name'], 17, false, 0),
                            TextLabel(true, false, false, false, true,
                            suggestion['price'], 17, false, 0),
                          ],
                        ),
                      )
                    ],
                  )
                );
              },
              hideOnEmpty: true,
              hideOnLoading: true,
              onSuggestionSelected: (dynamic suggestion) {
                onRedirectProduct(suggestion['id']);
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                color: Colors.white,
                child: Center(
                  child: TextLabel(false, false, false, false, true,
                      'Không tìm thấy sản phẩm!', 20, false, 0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// child: Padding(
            //     padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            //     child: SizedBox(
            //       height: 50,
            //       child: TextFormField(
            //         controller: inputText,
            //         cursorColor: Color.fromRGBO(4, 118, 78, 1),
            //         decoration: InputDecoration(
            //           filled: true,
            //           fillColor: Color.fromRGBO(250, 250, 250, 1),
            //           hoverColor: Color.fromRGBO(250, 250, 250, 1),
            //           enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(60.0),
            //             borderSide: BorderSide(
            //               color: Color.fromRGBO(230, 230, 230, 1),
            //               width: .5)),
            //           focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(60.0),
            //             borderSide: BorderSide(
            //               color: Color.fromRGBO(230, 230, 230, 1),
            //               width: .5)),
            //           hintStyle:
            //             GoogleFonts.quicksand(color: Color.fromRGBO(150, 150, 150, 1)),
            //             hintText: placeHolder,
            //           suffixIcon: MouseRegion(
            //             cursor: SystemMouseCursors.click,
            //             child: GestureDetector(
            //               onTap: () => onInputSearch(inputText.text),
            //               child: Icon(Icons.search, color: Color.fromRGBO(150, 150, 150, 1)),
            //             ),
            //           ),
            //       ),
            //     )),
            // ),
