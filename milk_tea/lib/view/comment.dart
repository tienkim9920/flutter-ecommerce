import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:milk_tea/component/button.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/component/text-label.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/custom-color.dart';

class Comment extends StatelessWidget {

  final ProductModel product;
  final CurrentParent currentParent;
  final Function backStep;
  final Function nextStep;
  final List star;
  final Function onChangeStar;
  final int countStar;
  final TextEditingController textComment;
  final Function onChangeText;

  const Comment(this.product, this.currentParent, this.backStep, this.nextStep, this.star, this.onChangeStar,
    this.countStar, this.textComment, this.onChangeText, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 220,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Navbar(true, true, true, true, 'Nhận xét', 'option.png', 
                  () => backStep(currentParent.id, currentParent.name), () => nextStep()),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 211, 211, 211),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -50,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.asset('assets/tradao.png')
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLabel(false, false, false, true, false, 'Trà Xanh Đá Xay', 18, true, 0),
                            SizedBox(height: 15.0),
                            Text("Loại SP",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.quicksand(
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 16)),
                            SizedBox(height: 15.0),
                            TextLabel(true, false, false, true, false, '70000', 18, true, 0),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 30.0),
              TextLabel(false, false, false, true, false, 'Bạn có thích sản phẩm này', 20, false, 1),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: 
                TextLabel(false, false, false, true, false, 'Vui lòng để lại đánh giá và nhận xét của bạn để chúng tôi biết!', 16, false, 1),
              ),
              SizedBox(height: 30.0),
              TextLabel(false, false, false, true, false, '${countStar.toString()}.0', 60, false, 1),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...star.map((item) =>
                  GestureDetector(
                    onTap: () => { onChangeStar(item['id']) },
                    child: item['status'] ?  
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5), 
                        child: Image.asset('assets/star-active.png')) :
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5), 
                        child: Image.asset('assets/star-unactive.png'))
                    )
                  ).toList()
                ],
              ),
              SizedBox(height: 35.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: SizedBox(
                      height: 130,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: 5,
                        controller: textComment,
                        cursorColor: Color.fromRGBO(4, 118, 78, 1),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hoverColor: Color.fromRGBO(250, 250, 250, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(CustomColor().R, CustomColor().G, CustomColor().B, 1),
                              width: 2)),
                          hintStyle:
                            GoogleFonts.quicksand(color: Color.fromRGBO(150, 150, 150, 1)),
                            hintText: "Viết nhận xét của bạn ở đây",
                      ),
                    )),
                )
              ),
              SizedBox(height: 20.0),
              Button(0, 0, "Gửi", CustomColor(), () => onChangeText(textComment))
            ],
          )
        ],
      ),
    );
  }
}