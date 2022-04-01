import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceProduct {
  String url = '${Environment().http}/product';
  String urlCategory = '${Environment().http}/product-category';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> getBanner() async {
    Response response = await get(Uri.parse('${url}/banner'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getDetail(String id) async {
    Response response = await get(Uri.parse('${url}/${id}'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getProductCategory(String category) async {
    Response response =
        await get(Uri.parse('${url}/category?category=${category}'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getProducts() async {
    Response response = await get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<List<dynamic>> getSearchProducts(String query) async {
    Response response = await get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    return data
        .where((item) =>
            item['name']
                .toString()
                .toLowerCase()
                .contains(query.toString().toLowerCase()) &&
            item['name']
                .toString()
                .toLowerCase()
                .startsWith(query.toString().toLowerCase()))
        .toList();
  }

  Future<dynamic> getCategories() async {
    Response response = await get(Uri.parse(urlCategory));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getCountProduct() async {
    Response response = await get(Uri.parse('${url}/category/count'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
