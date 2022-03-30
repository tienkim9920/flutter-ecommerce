import 'dart:convert';

import 'package:http/http.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceOrder {
  String url = '${Environment().http}/order';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> postOrder(String request) async {
    Response response = await post(
      Uri.parse(url),
      headers: headers,
      body: request,
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> getListOrder(String? userId) async {
    Response response = await get(Uri.parse('${url}/user/${userId}'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getDetail(String orderId) async {
    Response response = await get(Uri.parse('${url}/${orderId}'));
    return jsonDecode(response.body);
  }
}
