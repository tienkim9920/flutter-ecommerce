import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:localstorage/localstorage.dart';
import 'package:milk_tea/component/menu-widget.dart';
import 'package:milk_tea/component/menu.dart';
import 'package:milk_tea/constant/name-component.dart';
import 'package:milk_tea/mapping/feedback.mapping.dart';
import 'package:milk_tea/mapping/order.mapping.dart';
import 'package:milk_tea/mapping/user.mapping.dart';
import 'package:milk_tea/models/feedback.model.dart';
import 'package:milk_tea/models/order.model.dart';
import 'package:milk_tea/pattern/category-item.dart';
import 'package:milk_tea/pattern/checkout-item.dart';
import 'package:milk_tea/pattern/current-parent.dart';
import 'package:milk_tea/pattern/menu-item.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/pattern/order-detail-item.dart';
import 'package:milk_tea/pattern/user-edit.dart';
import 'package:milk_tea/service/feedback.service.dart';
import 'package:milk_tea/service/order.service.dart';
import 'package:milk_tea/service/product.service.dart';
import 'package:milk_tea/service/user.service.dart';
import 'package:milk_tea/store/authenticate.store.dart';
import 'package:milk_tea/store/cart.store.dart';
import 'package:milk_tea/view/cart.dart';
import 'package:milk_tea/view/checking-order.dart';
import 'package:milk_tea/view/checkout.dart';
import 'package:milk_tea/view/comment.dart';
import 'package:milk_tea/view/feedback.dart';
import 'package:milk_tea/view/history.dart';
import 'package:milk_tea/view/home.dart';
import 'package:milk_tea/view/loading.dart';
import 'package:milk_tea/view/password-change.dart';
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
  final LocalStorage storage = LocalStorage('auth');
  String? userId;
  late Map<dynamic, dynamic> informationUser;

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
  List<dynamic> countProduct = [];

  // Product Detail
  Map product = {};
  List<dynamic> products = [];
  double sizeProductDetail = 0;
  String sizeRealProduct = "S";
  int countProductDetail = 1;
  bool modalDetail = false;

  // input search
  TextEditingController inputSearch = TextEditingController();

  // category product
  List<dynamic> categoryItems = [];
  String currentCategoryItem = '0';

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
  bool errorTextComment = false;
  bool modalFeedback = false;
  bool loadingFeedback = false;
  List<dynamic> feedbacks = [];
  List<dynamic> storeFeedbacks = [];

  // Cart
  List<dynamic> carts = CartOrder().getCart();
  dynamic total = 0;

  // Checkout
  CheckoutItem checkoutItem = CheckoutItem();
  bool modalCheckout = false;
  bool loadingCheckout = false;

  // History
  List<dynamic> histories = [];
  Map history = {};

  // GET method API Home
  void getDataHome() async {
    var res = await ServiceProduct().getBanner();
    slideProduct = res;
  }

  // GET method API Detail history
  void getDetailHistory(String orderId) async {
    var res = await ServiceOrder().getDetail(orderId);
    history = res;
    arrayDetailHistory.add(history);
  }

  // GET method API Detail
  void getDetailProduct(String id) async {
    var res = await ServiceProduct().getDetail(id);
    product = res;
    arrayDetail.add(product);
  }

  // GET method API product category
  void getDataProducts() async {
    var res = await ServiceProduct().getProducts();
    products = res;
  }

  // GET method API category
  void getCategories() async {
    var res = await ServiceProduct().getCategories();
    categoryItems = res;
    categoryItems.insert(0, {'id': '0', 'name': 'Tất cả'});
  }

  // GET method API count category product
  void getCountProduct() async {
    var res = await ServiceProduct().getCountProduct();
    countProduct = res;

    int sumProduct = 0;
    countProduct
        .forEach((element) => sumProduct += int.parse(element['countProduct']));
    countProduct.insert(
        0, {"id": 0, "name": "Tất cả", "countProduct": sumProduct.toString()});
  }

  // GET method API list order
  void getDataOrders() async {
    var res = await ServiceOrder().getListOrder(userId);
    histories = res;
    histories = reversedList(histories);
  }

  @override
  void initState() {
    getDataHomeAPI();
    getCountProduct();
    getUserId();
    getInformationUser();
    super.initState();
  }

  void getUserId() async {
    await storage.ready;
    Map<String, dynamic> payload = Jwt.parseJwt(await storage.getItem('jwt'));
    userId = payload['user']['id'].toString();
  }

  void getInformationUser() async {
    await storage.ready;
    Map<dynamic, dynamic> payload = Jwt.parseJwt(await storage.getItem('jwt'));
    informationUser = payload['user'];
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

    setState(() => {
          sizeProductDetail = 0,
          countProductDetail = 1,
          sizeProductDetail = 0,
          sizeRealProduct = 'S'
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

  // GET Data Detail History
  List<dynamic> arrayDetailHistory = [];
  void getDataDetailHistoryAPI(String orderId) {
    bool flag = false;
    arrayDetailHistory.forEach((element) => {
          if (element['id'].toString() == orderId.toString())
            {history = element, flag = true}
        });

    if (flag) {
      updateCurrentItem(IDComponent().kiemtra, NameComponent().kiemtra);
      return;
    }

    getDetailHistory(orderId);
    Future.delayed(
        const Duration(seconds: 1),
        () => {
              updateCurrentItem(IDComponent().kiemtra, NameComponent().kiemtra)
            });
  }

  // get Screen
  dynamic getScreen() {
    switch (currentItem) {
      case 'loading':
        return Loading();
      case 'trangchu':
        updateCurrentParent(
            CurrentParent(IDComponent().trangchu, NameComponent().trangchu));
        return Home(
            (productId) => getDataDetailAPI(productId),
            inputSearch,
            (onInputSearch) => {print(onInputSearch)},
            slideProduct,
            countProduct,
            (id) => getDataViewScreenProduct(id.toString()));
      case 'sanpham':
        updateCurrentParent(
            CurrentParent(IDComponent().sanpham, NameComponent().sanpham));
        // GET API List Product
        return Product(
          categoryItems,
          currentCategoryItem,
          (categoryItemId) => {
            setState(() => {currentCategoryItem = categoryItemId.toString()})
          },
          inputSearch,
          (onInputSearch) => getDataSearchProduct(onInputSearch),
          products,
          (productId) => {getDataDetailAPI(productId)},
        );
      case 'giohang':
        carts = CartOrder().getCart();
        total = CartOrder().totalCarts();
        return Cart(
          carts,
          (productId) => handleRedirectCheckout(), // click order
          (up) => increaseCount(up),
          (down) => decreaseCount(down),
          total.toString(),
          (delete) => handleDeleteProduct(delete),
          (id) => {
            updateCurrentParent(
                CurrentParent(IDComponent().giohang, NameComponent().giohang)),
            getDataDetailAPI(id.toString()),
          },
        );
      case 'hoso':
        return Profile(
          informationUser,
          () => updateCurrentItem(
              IDComponent().password, NameComponent().password),
        );
      case 'lichsu':
        return History(
          (orderId) => getDataDetailHistoryAPI(orderId.toString()),
          histories,
          informationUser,
        );
      case 'chitietsanpham':
        return ProductDetail(
          product,
          (id, name) => updateCurrentItem(id, name), // backStep
          currentParent,
          sizeProductDetail,
          (size) => handlerGetSizeProduct(size),
          countProductDetail,
          () => {setState(() => countProductDetail--)},
          () => {setState(() => countProductDetail++)},
          (id) => handlerCartOrder(id),
          () => {
            updateCurrentItem(IDComponent().nhanxet, NameComponent().nhanxet),
            handleDataFeedbacks(product['id'].toString())
          }, // nextStep
          modalDetail,
          () => setState(() => modalDetail = false),
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
              IDComponent().feedback, NameComponent().feedback), // nextStep
          star,
          (index) => {
            setState(() => {
                  star[index]['status'] = !star[index]['status'],
                  if (star[index]['status']) {countStar++} else {countStar--}
                })
          },
          countStar,
          textComment,
          (text) => handleComment(text),
          errorTextComment,
          modalFeedback,
          () => {
            setState(() => modalFeedback = false),
          },
          loadingFeedback,
        );
      case 'feedback':
        updateCurrentParent(
            CurrentParent(IDComponent().nhanxet, NameComponent().nhanxet));
        return FeedBack(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)},
          product['name'],
          feedbacks,
        );
      case 'checkout':
        updateCurrentParent(
            CurrentParent(IDComponent().giohang, NameComponent().giohang));
        return Checkout(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)}, // backStep
          checkoutItem,
          () => {
            setState(() => modalCheckout = false),
            updateCurrentItem(IDComponent().kiemtra, NameComponent().kiemtra),
          },
          modalCheckout,
          (data) => handleCheckout(data),
          total.toString(),
          loadingCheckout,
          errorPhoneCheckout,
          errorAddressCheckout,
        );
      case 'kiemtra':
        updateCurrentParent(
            CurrentParent(IDComponent().lichsu, NameComponent().lichsu));
        return CheckingOrder(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)},
          history,
          informationUser,
        );
      case 'chinhsuahoso':
        updateCurrentParent(
            CurrentParent(IDComponent().hoso, NameComponent().hoso));
        forwardUserEditProfile();
        return ProfileDetail(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)},
          userEditProfile,
          isPasswordUser,
          () => {setState(() => isPasswordUser = !isPasswordUser)},
          (data) => handleEditProfile(data),
          modalEditProfile,
          errorFullname,
          errorEmail,
        );
      case 'thaydoimatkhau':
        updateCurrentParent(
            CurrentParent(IDComponent().hoso, NameComponent().hoso));
        return PasswordChange(
          currentParent,
          (id, name) => {updateCurrentItem(id, name)},
          userPassword,
          modalPassword,
          (data) => handleUpdatePassword(data),
          errorPassword,
          errorNewPassword,
          errorConfirmPassword,
          passwordInvalid,
          newPasswordInvalid,
          confirmPasswordInvalid,
          showPassword,
          () => setState(() => showPassword = !showPassword),
          showNewPassword,
          () => setState(() => showNewPassword = !showNewPassword),
          showConfirmPassword,
          () => setState(() => showConfirmPassword = !showConfirmPassword),
        );
    }
  }

  void handleRedirectCheckout() {
    if (carts.isEmpty) {
      return;
    }
    updateCurrentItem(IDComponent().checkout, NameComponent().checkout);
  }

  // Profile
  UserEdit userEditProfile = UserEdit();
  bool isPasswordUser = true;
  bool modalEditProfile = false;
  bool modalPassword = false;
  bool errorFullname = false;
  bool errorEmail = false;

  bool errorPassword = false;
  bool errorNewPassword = false;
  bool errorConfirmPassword = false;

  bool passwordInvalid = false;
  bool newPasswordInvalid = false;
  bool confirmPasswordInvalid = false;

  bool showPassword = true;
  bool showNewPassword = true;
  bool showConfirmPassword = true;

  // profile password
  UserPassword userPassword = UserPassword();

  void forwardUserEditProfile() {
    userEditProfile.userId = userId;
    userEditProfile.fullname.text = informationUser['fullname'];
    userEditProfile.email.text = informationUser['email'];
    userEditProfile.address.text =
        informationUser['address'] == null ? '' : informationUser['address'];
    userEditProfile.phone.text =
        informationUser['phone'] == null ? '' : informationUser['phone'];
  }

  void handleEditProfile(UserEdit data) async {
    if (data.fullname.text.isEmpty) {
      setState(() => errorFullname = true);
      return;
    }
    if (data.email.text.isEmpty) {
      setState(() => errorEmail = true);
      return;
    }

    var res = await ServiceUser()
        .postEditProfile(UserMapping().MapServiceEditProfile(data));

    setInformationForUser(res);

    setState(() {
      modalEditProfile = true;
      userEditProfile.fullname.text = data.fullname.text;
      userEditProfile.address.text = data.address.text;
      userEditProfile.email.text = data.email.text;
      userEditProfile.phone.text = data.phone.text;
    });

    Future.delayed(
        const Duration(seconds: 2),
        () => {
              updateCurrentItem(IDComponent().hoso, NameComponent().hoso),
              setState(() => {
                    modalEditProfile = false,
                    errorFullname = false,
                    errorEmail = false
                  })
            });
  }

  void handleUpdatePassword(UserPassword data) async {
    setState(() => {
          errorPassword = false,
          errorNewPassword = false,
          errorConfirmPassword = false,
          confirmPasswordInvalid = false,
          passwordInvalid = false,
        });
    if (data.password.text.isEmpty) {
      setState(() => errorPassword = true);
      return;
    }
    if (data.newPassword.text.isEmpty) {
      setState(() => errorNewPassword = true);
      return;
    }
    if (data.confirmPassword.text.isEmpty) {
      setState(() => errorConfirmPassword = true);
      return;
    }

    if (data.confirmPassword.text != data.newPassword.text) {
      setState(
          () => {confirmPasswordInvalid = true, errorConfirmPassword = true});
      return;
    }

    setState(() => modalPassword = true);
    data.userId = userId;
    var res = await ServiceUser()
        .postEditPassword(UserMapping().MapServiceEditPassword(data));

    if (res == 'Password is invalid') {
      setState(() => {
            passwordInvalid = true,
            errorPassword = true,
            modalPassword = false
          });
      return;
    }

    setInformationForUser(res);

    Future.delayed(
        const Duration(seconds: 2),
        () => {
              updateCurrentItem(IDComponent().hoso, NameComponent().hoso),
              setState(() => {
                    modalPassword = false,
                    showPassword = true,
                    showNewPassword = true,
                    showConfirmPassword = true,
                  }),
              userPassword.password.text = '',
              userPassword.newPassword.text = '',
              userPassword.confirmPassword.text = '',
            });
  }

  void setInformationForUser(String res) {
    Authenticate().setToken(res);
    getUserId();
    getInformationUser();
  }

  void handleDataFeedbacks(String productId) async {
    bool flag = false;
    for (var i = 0; i < storeFeedbacks.length; i++) {
      if (storeFeedbacks[i]['productId'] == productId) {
        feedbacks = storeFeedbacks[i]['feedbacks'];
        flag = true;
        return;
      }
    }

    if (flag) {
      return;
    }

    var res = await ServiceFeedback().getFeedbacks(productId);
    feedbacks = res;
    feedbacks = reversedList(feedbacks);
    Map data = {'productId': productId, 'feedbacks': res};
    storeFeedbacks.add(data);
  }

  dynamic reversedList(List<dynamic> array) {
    List<dynamic> reversedNew = array.reversed.toList();
    return reversedNew;
  }

  void handleComment(String text) async {
    setState(() => errorTextComment = false);
    if (text.isEmpty) {
      setState(() => errorTextComment = true);
      return;
    }

    FeedbackModel feedbackModel = FeedbackModel();
    feedbackModel.content = text;
    feedbackModel.star = countStar.toString();
    feedbackModel.productId = product['id'].toString();
    feedbackModel.userId = userId!;

    setState(() => loadingFeedback = true);
    var res = await ServiceFeedback()
        .postFeedback(FeedbackMapping().MapServiceFeedback(feedbackModel));

    for (var i = 0; i < storeFeedbacks.length; i++) {
      if (storeFeedbacks[i]['productId'] == product['id'].toString()) {
        feedbacks.add(res);
        storeFeedbacks[i]['feedbacks'] = feedbacks;
        feedbacks = reversedList(feedbacks);
      }
    }

    Future.delayed(
        const Duration(seconds: 2),
        () => {
              setState(() => {
                    loadingFeedback = false,
                    modalFeedback = true,
                    textComment.text = ''
                  })
            });
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

  bool errorPhoneCheckout = false;
  bool errorAddressCheckout = false;

  void handleCheckout(CheckoutItem data) async {
    setState(() {
      errorPhoneCheckout = false;
      errorAddressCheckout = false;
    });
    if (data.phone.text.isEmpty) {
      setState(() => errorPhoneCheckout = true);
      return;
    }
    if (data.addressHome.text.isEmpty) {
      setState(() => errorAddressCheckout = true);
      return;
    }

    setState(() => loadingCheckout = true);
    checkoutItem.addressShow = '${data.addressHome.text}, ${data.addressState}';
    OrderModel orderModel = OrderModel();
    orderModel.address = checkoutItem.addressShow;
    orderModel.phone = checkoutItem.phone.text;
    orderModel.total = CartOrder().totalCarts().toString();
    orderModel.delivery = '0';
    orderModel.pay = false;
    orderModel.paymentId = '1';
    orderModel.userId = userId;
    if (checkoutItem.checkingCoupon == true) {
      orderModel.couponId = checkoutItem.couponId;
    }
    if (checkoutItem.note.text.isNotEmpty) {
      orderModel.note = checkoutItem.note.text;
    }
    for (var i = 0; i < carts.length; i++) {
      Map orderDetailItem = {
        'productId': carts[i]['product']['id'].toString(),
        'count': carts[i]['count'].toString(),
        'size': carts[i]['size'].toString()
      };
      orderModel.products.add(orderDetailItem);
    }

    var res = await ServiceOrder()
        .postOrder(OrderMapping().MapServiceOrder(orderModel));

    Future.delayed(
        const Duration(seconds: 3),
        () => {
              checkoutItem.addressHome.text = '',
              checkoutItem.phone.text = '',
              checkoutItem.coupon.text = '',
              checkoutItem.checkingCoupon = false,
              checkoutItem.note.text = '',
              setInformationForUser(res['token']),
              getDetailHistory(res['order']['id'].toString()),
              if (histories.isEmpty)
                {getDataOrders()}
              else
                {
                  histories = reversedList(histories),
                  histories.add(res['order']),
                  histories = reversedList(histories),
                },
              CartOrder().clearCart(),
              setState(() => {modalCheckout = true, loadingCheckout = false}),
            });
  }

  void increaseCount(dynamic up) {
    int index = carts.indexWhere(
        (element) => element['id'].toString() == up['id'].toString());
    setState(() => carts[index]['count'] += 1);
    CartOrder().setCart(carts);
    setState(() => total = CartOrder().totalCarts());
  }

  void decreaseCount(dynamic down) {
    int index = carts.indexWhere(
        (element) => element['id'].toString() == down['id'].toString());
    if (carts[index]['count'] == 1) {
      return;
    }
    setState(() => carts[index]['count'] -= 1);
    CartOrder().setCart(carts);
    setState(() => total = CartOrder().totalCarts());
  }

  void handleDeleteProduct(dynamic id) {
    int index = carts
        .indexWhere((element) => element['id'].toString() == id.toString());
    carts.removeAt(index);
    CartOrder().setCart(carts);
    setState(() => total = CartOrder().totalCarts());
  }

  void handlerGetSizeProduct(double size) {
    setState(() => sizeProductDetail = size);
    if (sizeProductDetail >= 0 && sizeProductDetail <= 35) {
      setState(() => sizeRealProduct = 'S');
    } else if (sizeProductDetail > 35 && sizeProductDetail <= 70) {
      setState(() => sizeRealProduct = 'M');
    } else {
      setState(() => sizeRealProduct = 'L');
    }
  }

  void handlerCartOrder(String id) {
    dynamic data = {
      "id": Random().nextInt(1000000),
      "product": product,
      "count": countProductDetail,
      "size": sizeRealProduct
    };
    CartOrder().addCart(data);
    setState(() => modalDetail = true);
  }

  void getDataSearchProduct(String keyword) {
    setState(() => currentCategoryItem = keyword);
  }

  void getDataViewScreenProduct(String id) {
    if (products.isNotEmpty) {
      updateCurrentItem(IDComponent().sanpham, NameComponent().sanpham);
      setState(() => currentCategoryItem = id);
      return;
    }
    getDataProducts();
    getCategories();
    Future.delayed(
        const Duration(seconds: 1),
        () =>
            updateCurrentItem(IDComponent().sanpham, NameComponent().sanpham));
  }

  bool checkAccess = false;
  void getDataViewHistory() {
    if (histories.isNotEmpty || checkAccess == true) {
      updateCurrentItem(IDComponent().lichsu, NameComponent().lichsu);
      return;
    }
    checkAccess = true;
    getDataOrders();
    Future.delayed(
        const Duration(seconds: 1),
        () => {
              updateCurrentItem(IDComponent().lichsu, NameComponent().lichsu),
            });
  }

  void changeViewScreen(String id, String title) {
    switch (id) {
      case 'trangchu':
        updateCurrentItem(id, title);
        break;
      case 'sanpham':
        getDataViewScreenProduct(currentCategoryItem);
        break;
      case 'giohang':
        updateCurrentItem(id, title);
        break;
      case 'hoso':
        updateCurrentItem(id, title);
        break;
      case 'lichsu':
        getDataViewHistory();
        break;
      case 'chitietsanpham':
        break;
      case 'dangxuat':
        break;
    }
  }

  void handleLogout() {
    Navigator.pop(context);
    Authenticate().clearToken();
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
            changeViewScreen(item.id, item.title),
            ZoomDrawer.of(context)!.close()
          },
          () => handleLogout(),
        ),
      ),
      mainScreen: Scaffold(
        appBar: getAppBar(),
        body: getScreen(),
      ));
}
