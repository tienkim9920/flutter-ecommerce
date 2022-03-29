import 'dart:convert';
import 'package:http/http.dart';
import 'package:milk_tea/service/environment.service.dart';

class ServiceUser {
  String url = '${Environment().http}/user';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> postSignUp(String request) async {
    Response response = await post(
      Uri.parse(url),
      headers: headers,
      body: request,
    );
    return response.body;
  }

  Future<dynamic> postSignIn(String request) async {
    Response response =
        await post(Uri.parse('${url}/signin'), headers: headers, body: request);
    return response.body;
  }

  Future<dynamic> postEditProfile(String request) async {
    Response response = await post(
      Uri.parse('${url}/edit'),
      headers: headers,
      body: request,
    );
    return response.body;
  }
}
