import 'package:jwt_decode/jwt_decode.dart';
import 'package:localstorage/localstorage.dart';

class Authenticate {
  final LocalStorage storage = LocalStorage('auth');

  String? userId;

  void setToken(String token) {
    storage.setItem('jwt', token);
  }

  dynamic getToken() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user'];
  }

  dynamic getFullName() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user']['fullname'];
  }

  dynamic getAddress() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user']['address'];
  }

  dynamic getEmail() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user']['email'];
  }

  dynamic getImage() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user']['image'];
  }

  dynamic getScore() {
    Map<String, dynamic> payload = Jwt.parseJwt(storage.getItem('jwt'));
    return payload['user']['score'];
  }

  dynamic getUserId() async {
    await storage.ready;
    Map<String, dynamic> payload = Jwt.parseJwt(await storage.getItem('jwt'));
    userId = payload['user']['id'].toString();
  }
}
