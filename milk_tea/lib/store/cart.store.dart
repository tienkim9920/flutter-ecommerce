import 'package:localstorage/localstorage.dart';

class CartOrder {
  final LocalStorage storage = LocalStorage('cart-order');

  void setCart(List<dynamic> carts) {
    storage.setItem('cart', carts);
  }

  void clearCart() {
    storage.deleteItem('cart');
  }

  dynamic getCart() {
    List<dynamic> payload = storage.getItem('cart') ?? [];
    return payload;
  }

  void addCartsInStore(dynamic data) {
    List<dynamic> cartsInStore = getCart();
    cartsInStore.add(data);
    setCart(cartsInStore);
  }

  void addCart(dynamic data) {
    List<dynamic> cartsInStore = getCart();

    if (cartsInStore.isEmpty) {
      addCartsInStore(data);
    } else {
      int index = cartsInStore.indexWhere(
          (element) => element['product']['id'] == data['product']['id']);

      if (index != -1) {
        if (cartsInStore[index]['size'] != data['size']) {
          addCartsInStore(data);
          return;
        }
        cartsInStore[index]['count'] += data['count'];
        setCart(cartsInStore);
      } else {
        addCartsInStore(data);
      }
    }
  }

  dynamic totalCarts() {
    dynamic total = 0;
    List<dynamic> cartsInStore = getCart();

    for (var i = 0; i < cartsInStore.length; i++) {
      total += cartsInStore[i]['count'] *
          int.parse(cartsInStore[i]['product']['price']);
    }

    return total;
  }

  dynamic updateTotalCarts(dynamic coupon) {
    int total = totalCarts();

    if (coupon['couponCategoryId'] == 1) {
      total -= int.parse(coupon['promotion']);
    } else {
      total -= ((total * int.parse(coupon['promotion'])) / 100).ceil();
    }

    return total;
  }
}
