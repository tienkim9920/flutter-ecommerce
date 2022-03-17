import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milk_tea/component/menu-widget.dart';
import 'package:milk_tea/component/menu.dart';
import 'package:milk_tea/constant/name-component.dart';
import 'package:milk_tea/pattern/category-item.dart';
import 'package:milk_tea/pattern/checkout-item.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/menu-item.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/view/cart.dart';
import 'package:milk_tea/view/checkout.dart';
import 'package:milk_tea/view/comment.dart';
import 'package:milk_tea/view/feedback.dart';
import 'package:milk_tea/view/history.dart';
import 'package:milk_tea/view/home.dart';
import 'package:milk_tea/view/product-detail.dart';
import 'package:milk_tea/view/product.dart';
import 'package:milk_tea/view/profile.dart';

class Index extends StatefulWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  // Change Current Screen
  String currentItem = IDComponent().trangchu;
  String currentScreen = NameComponent().trangchu;
  // late CurrentParent currentParent = CurrentParent(IDComponent().nhanxet, NameComponent().nhanxet);
  late CurrentParent currentParent;

  // List Drawer Menu
  List<MenuItem> menuItems = [
    MenuItem(IDComponent().trangchu, NameComponent().trangchu, Icons.home),
    MenuItem(IDComponent().sanpham, NameComponent().sanpham, Icons.shopping_cart),
    MenuItem(IDComponent().giohang, NameComponent().giohang, Icons.shopping_bag),
    MenuItem(IDComponent().hoso, NameComponent().hoso, Icons.person),
    MenuItem(IDComponent().lichsu, NameComponent().lichsu, Icons.menu_book),
  ];

  // Update Current Item
  void updateCurrentItem(String id, String name){
    setState(() => {
      currentItem = id,
      currentScreen = name
    });
  }

  void updateCurrentParent(CurrentParent parent){
    setState(() {
      currentParent = parent;
    });
  }

  // Home
  List slideProduct = [
    { 'id': '1', 'image': 'assets/tradao.png', 'name': 'Trà Đào', 'price': '70000' },
    { 'id': '2', 'image': 'assets/tradao.png', 'name': 'Trà Đào', 'price': '70000' },
    { 'id': '3', 'image': 'assets/tradao.png', 'name': 'Trà Đào', 'price': '70000' },
  ];

  // Product Detail
  ProductModel product = ProductModel();
  List<ProductModel> products = [];
  double sizeProductDetail = 0;
  int countProductDetail = 1;

  // input search
  TextEditingController inputSearch = TextEditingController();

  // category product
  List<CategoryItem> categoryItems = [
    CategoryItem('1', 'Tất Cả'),
    CategoryItem('2', 'Trà Sữa'),
    CategoryItem('3', 'Trà Hoa Quả'),
    CategoryItem('4', 'Coffee'),
  ];
  String currentCategoryItem = '1';

  // Comment
  List star = [
    { 'id': 0, 'status': true},
    { 'id': 1, 'status': true},
    { 'id': 2, 'status': true},
    { 'id': 3, 'status': true},
    { 'id': 4, 'status': false},
  ]; 
  int countStar = 4;
  TextEditingController textComment = TextEditingController();

  // Cart

  // Checkout
  CheckoutItem checkoutItem = CheckoutItem();

  // get Screen
  dynamic getScreen(){
    switch(currentItem){
      case 'trangchu':
        updateCurrentParent(CurrentParent(IDComponent().trangchu, NameComponent().trangchu));
        return Home(
          (productId) => {
            // GET API Detail Product
            product.id = productId,
            updateCurrentItem(IDComponent().chitietsanpham, NameComponent().chitietsanpham)
          },
          inputSearch,
          (onInputSearch) => {
            print(onInputSearch)
          },
          slideProduct
        );
      case 'sanpham':
        updateCurrentParent(CurrentParent(IDComponent().sanpham, NameComponent().sanpham));
        // GET API List Product
        return Product(
          categoryItems, 
          currentCategoryItem, 
          (categoryItemId) => {
            setState(() => {
              currentCategoryItem = categoryItemId
            })
          }, 
          inputSearch, 
          (onInputSearch) => {
            print(onInputSearch)
          }, products, 
          (productId) => {
            // GET API Detail Product
            product.id = productId,
            updateCurrentItem(IDComponent().chitietsanpham, NameComponent().chitietsanpham)
          }
        );
      case 'giohang':
        return Cart(
          (productId) => updateCurrentItem(IDComponent().checkout, NameComponent().checkout), // click order
        );
      case 'hoso':
        return Profile();
      case 'lichsu':
        return History();
      case 'chitietsanpham':
        return ProductDetail(
          product, 
          (id, name) => updateCurrentItem(id, name), // backStep
          currentParent, 
          sizeProductDetail, 
          (size) => {
            setState(() => {
              sizeProductDetail = size
            }),
          },
          countProductDetail,
          () => {
            setState(() => countProductDetail--)
          },
          () => {
            setState(() => countProductDetail++)
          },
          (data) => {
            print("Them san pham ${data} vao gio hang")
          },
          () => updateCurrentItem(IDComponent().nhanxet, NameComponent().nhanxet) // nextStep
        );
      case 'nhanxet':
        updateCurrentParent(CurrentParent(IDComponent().chitietsanpham, NameComponent().chitietsanpham));
        return Comment(
          product, 
          currentParent,
          (id, name) => {
            updateCurrentItem(id, name),
            updateCurrentParent(CurrentParent(IDComponent().sanpham, NameComponent().sanpham))
          },  // backStep
          () => updateCurrentItem(IDComponent().nhanxet, NameComponent().nhanxet), // nextStep
          star,
          (index) => { 
            setState(() => {
                star[index]['status'] = !star[index]['status'],
                if (star[index]['status']){
                  countStar++
                }else {
                  countStar--
                }
              }
            ) 
          },
          countStar,
          textComment,
          (text) => print(text)
        );
      case 'feedback':
        updateCurrentParent(CurrentParent(IDComponent().nhanxet, NameComponent().nhanxet));
        return FeedBack();
      case 'checkout':
        updateCurrentParent(CurrentParent(IDComponent().giohang, NameComponent().giohang));
        return Checkout(
          currentParent, 
          (id, name) => {
            updateCurrentItem(id, name)
          }, // backStep
          () => print("Đặt hàng thành công =))"), // nextStep
          checkoutItem,
          (id) => print(id)
        );
    }
  }

  // get AppBar
  dynamic getAppBar(){
    switch(currentItem){
      case 'trangchu':
        return showAppBar();
      case 'sanpham':
        return showAppBar();
      case 'giohang':
        return showAppBar();
      case 'hoso':
        return showAppBar();
      case 'lichsu':
        return showAppBar();
      case 'chitietsanpham':
        return null;
    }
  }

  dynamic showAppBar(){
    return AppBar(
      title: Text(currentScreen, 
        style: GoogleFonts.quicksand(
          color: Color.fromRGBO(20, 20, 20, 0.7)
        ),
      ),
      centerTitle: true,
      leading: MenuWidget(),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Image.asset('assets/buy.png'),
          onPressed: () => updateCurrentItem(IDComponent().giohang, NameComponent().giohang),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    style: DrawerStyle.Style1,
    borderRadius: 20,
    angle: -7,
    slideWidth: MediaQuery.of(context).size.width * .73,
    showShadow: true,
    backgroundColor: Color.fromRGBO(4, 118, 78, 0.7),
    menuScreen: Builder(
      builder: (context) => Menu(currentItem, menuItems, (item) => {
        setState(() => {
          currentItem = item.id,
          currentScreen = item.title
        }),
        ZoomDrawer.of(context)!.close(),
      }),
    ),
    mainScreen: Scaffold(
      appBar: getAppBar(),
      body: getScreen(),
    )
  );
}