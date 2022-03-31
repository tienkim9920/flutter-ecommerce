import 'dart:convert';

import 'package:http/http.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceFeedback {
  String url = '${Environment().http}/feedback';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> postFeedback(String request) async {
    Response response = await post(
      Uri.parse(url),
      headers: headers,
      body: request,
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> getFeedbacks(String productId) async {
    Response response = await get(Uri.parse('${url}/${productId}'));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
