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
import 'package:milk_tea/service/product.service.dart';
import 'package:milk_tea/view/cart.dart';
import 'package:milk_tea/view/checking-order.dart';
import 'package:milk_tea/view/checkout.dart';
import 'package:milk_tea/view/comment.dart';
import 'package:milk_tea/view/feedback.dart';
import 'package:milk_tea/view/history.dart';
import 'package:milk_tea/view/home.dart';
import 'package:milk_tea/view/loading.dart';
import 'package:milk_tea/view/product-detail.dart';
import 'package:milk_tea/view/product.dart';
import 'package:milk_tea/view/profile-detail.dart';
import 'package:milk_tea/view/profile.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  // Change Current Screen
  String currentItem = IDComponent().loading;
  String currentScreen = NameComponent().loading;
  // late CurrentParent currentParent = CurrentParent(IDComponent().checkout, NameComponent().checkout);
  late CurrentParent currentParent;

  bool identify = false;

  // List Drawer Menu
  List<MenuItem> menuItems = [
    MenuItem(IDComponent().trangchu, NameComponent().trangchu, Icons.home),
    MenuItem(
        IDComponent().sanpham, NameComponent().sanpham, Icons.shopping_cart),
    MenuItem(
        IDComponent().giohang, NameComponent().giohang, Icons.shopping_bag),
    MenuItem(IDComponent().hoso, NameComponent().hoso, Icons.person),
    MenuItem(IDComponent().lichsu, NameComponent().lichsu, Icons.menu_book),
  ];

  // Update Current Item
  void updateCurrentItem(String id, String name) {
    setState(() => {currentItem = id, currentScreen = name});
  }

  void updateCurrentParent(CurrentParent parent) {
    setState(() {
      currentParent = parent;

      if (parent.id == IDComponent().trangchu) {
        identify = false;
      } else if (parent.id == IDComponent().sanpham) {
        identify = true;
      }
    });
  }

  // Home
  List<dynamic> slideProduct = [];

  // Product Detail
  Map product = {};
  List<dynamic> products = [];
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
    {'id': 0, 'status': true},
    {'id': 1, 'status': true},
    {'id': 2, 'status': true},
    {'id': 3, 'status': true},
    {'id': 4, 'status': false},
  ];
  int countStar = 4;
  TextEditingController textComment = TextEditingController();

  // Cart

  // Checkout
  CheckoutItem checkoutItem = CheckoutItem();
  bool modalCheckout = false;

  // Profile

  // Edit Profile
  TextEditingController user = TextEditingController();
  bool isPasswordUser = true;

  // History

  // GET method API Home
  void getDataHome() async {
    var res = await ServiceProduct().getBanner();
    slideProduct = res;
  }

  // GET method API Detail
  void getDetailProduct(String id) async {
    var res = await ServiceProduct().getDetail(id);
    product = res;
    arrayDetail.add(product);
  }

  // GET method API product category
  void getDataProduct(String currentCategoryItem) async {
    // var res = await
  }

  @override
  void initState() {
    getDataHomeAPI();
    super.initState();
  }

  // GET Data Home
  void getDataHomeAPI() {
    getDataHome();
    Future.delayed(
        const Duration(seconds: 2),
        () => {
              updateCurrentItem(
                  IDComponent().trangchu, NameComponent().trangchu)
            });
  }

  // GET Data Detail Product
  List<dynamic> arrayDetail = [];
  void getDataDetailAPI(String productId) {
    bool flag = false;
    arrayDetail.forEach((element) => {
          if (element['id'].toString() == productId.toString())
            {product = element, flag = true}
        });

    if (flag) {
      updateCurrentItem(
          IDComponent().chitietsanpham, NameComponent().chitietsanpham);
      return;
    }

    getDetailProduct(productId);
    Future.delayed(
        const Duration(seconds: 1),
        () => {
              updateCurrentItem(
                  IDComponent().chitietsanpham, NameComponent().chitietsanpham)
            });
  }

  // GET Data Product
  void getDataCategoryAPI(String currentCategoryItem) {}

  // get Screen
  dynamic getScreen() {
    switch (currentItem) {
      case 'loading':
        return Loading();
      case 'trangchu':
        updateCurrentParent(
            CurrentParent(IDComponent().trangchu, NameComponent().trangchu));
        return Home((productId) => getDataDetailAPI(productId), inputSearch,
            (onInputSearch) => {print(onInputSearch)}, slideProduct);
      case 'sanpham':
        updateCurrentParent(
            CurrentParent(IDComponent().sanpham, NameComponent().sanpham));
        // GET API List Product
        return Product(
            categoryItems,
            currentCategoryItem,
            (categoryItemId) => {
                  setState(() => {currentCategoryItem = categoryItemId})
                },
            inputSearch,
            (onInputSearch) => {print(onInputSearch)},
            products,
            (productId) => {
                  // GET API Detail Product
                  updateCurrentItem(IDComponent().chitietsanpham,
                      NameComponent().chitietsanpham)
                });
      case 'giohang':
        return Cart(
          (productId) => updateCurrentItem(
              IDComponent().checkout, NameComponent().checkout), // click order
        );
      case 'hoso':
        return Profile();
      case 'lichsu':
        return History(() =>
            updateCurrentItem(IDComponent().kiemtra, NameComponent().kiemtra));
      case 'chitietsanpham':
        return ProductDetail(
            product,
            (id, name) => updateCurrentItem(id, name), // backStep
            currentParent,
            sizeProductDetail,
            (size) => {
                  setState(() => {sizeProductDetail = size}),
                },
            countProductDetail,
            () => {setState(() => countProductDetail--)},
            () => {setState(() => countProductDetail++)},
            (data) => {print("Them san pham ${data} vao gio hang")},
            () => updateCurrentItem(
                IDComponent().nhanxet, NameComponent().nhanxet) // nextStep
            );
      case 'nhanxet':
        updateCurrentParent(CurrentParent(
            IDComponent().chitietsanpham, NameComponent().chitietsanpham));
        return Comment(
            product,
            currentParent,
            (id, name) => {
                  updateCurrentItem(id, name),
                  if (identify)
                    {
                      updateCurrentParent(CurrentParent(
                          IDComponent().sanpham, NameComponent().sanpham))
                    }
                  else
                    {
                      updateCurrentParent(CurrentParent(
                          IDComponent().trangchu, NameComponent().trangchu))
                    }
                }, // backStep
            () => updateCurrentItem(
                IDComponent().nhanxet, NameComponent().nhanxet), // nextStep
            star,
            (index) => {
                  setState(() => {
                        star[index]['status'] = !star[index]['status'],
                        if (star[index]['status'])
                          {countStar++}
                        else
                          {countStar--}
                      })
                },
            countStar,
            textComment,
            (text) => print(text));
      case 'feedback':
        updateCurrentParent(
            CurrentParent(IDComponent().nhanxet, NameComponent().nhanxet));
        return FeedBack();
      case 'checkout':
        updateCurrentParent(
            CurrentParent(IDComponent().giohang, NameComponent().giohang));
        return Checkout(
            currentParent,
            (id, name) => {updateCurrentItem(id, name)}, // backStep
            checkoutItem,
            (CheckoutItem informationUser) => {
                  print(informationUser.addressShow),
                  updateCurrentItem(
                      IDComponent().kiemtra, NameComponent().kiemtra),
                  setState(() => modalCheckout = false)
                },
            modalCheckout,
            () => {setState(() => modalCheckout = true)});
      case 'kiemtra':
        updateCurrentParent(
            CurrentParent(IDComponent().lichsu, NameComponent().lichsu));
        return CheckingOrder(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)},
        );
      case 'chinhsuahoso':
        updateCurrentParent(
            CurrentParent(IDComponent().hoso, NameComponent().hoso));
        return ProfileDetail(
            currentParent,
            (id, name) => {updateCurrentItem(id, name)},
            user,
            isPasswordUser,
            () => {setState(() => isPasswordUser = !isPasswordUser)});
    }
  }

  // get AppBar
  dynamic getAppBar() {
    switch (currentItem) {
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

  dynamic showAppBar() {
    return AppBar(
      title: Text(
        currentScreen,
        style: GoogleFonts.quicksand(color: Color.fromRGBO(20, 20, 20, 0.7)),
      ),
      centerTitle: true,
      leading: MenuWidget(),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: currentItem == IDComponent().hoso
              ? Image.asset('assets/pencil.png')
              : Image.asset('assets/buy.png'),
          onPressed: () => {
            currentItem == IDComponent().hoso
                ? updateCurrentItem(
                    IDComponent().chinhsuahoso, NameComponent().chinhsuahoso)
                : updateCurrentItem(
                    IDComponent().giohang, NameComponent().giohang)
          },
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
        builder: (context) => Menu(
            currentItem,
            menuItems,
            (item) => {
                  setState(() =>
                      {currentItem = item.id, currentScreen = item.title}),
                  ZoomDrawer.of(context)!.close(),
                }),
      ),
      mainScreen: Scaffold(
        appBar: getAppBar(),
        body: getScreen(),
      ));
}
