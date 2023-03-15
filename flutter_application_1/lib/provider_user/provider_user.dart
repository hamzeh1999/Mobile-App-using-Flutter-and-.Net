import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:http/http.dart' as http;

final urlApi = url;

class ProviderUser with ChangeNotifier {
  List<User> userList = [];
  getUserList() async {
    Uri url1 = Uri.http(urlApi, '/api/User');
    final response = await http.get(url1, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final responseFinal = userFromJson(response.body);
    userList = responseFinal;
    notifyListeners();
  }
}
