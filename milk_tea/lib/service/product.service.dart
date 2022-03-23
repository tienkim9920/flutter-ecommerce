import 'dart:convert';

import 'package:http/http.dart';
import 'package:milk_tea/models/product.model.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceProduct {
  String url = '${Environment().http}/product';
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
}
