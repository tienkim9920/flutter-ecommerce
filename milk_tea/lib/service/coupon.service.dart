import 'dart:convert';

import 'package:http/http.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceCoupon {
  String url = '${Environment().http}/coupon';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> postCoupon(String request) async {
    Response response = await post(
      Uri.parse(url),
      headers: headers,
      body: request,
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> getCoupons(String? userId) async {
    Response response = await get(Uri.parse('${url}/${userId}'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
