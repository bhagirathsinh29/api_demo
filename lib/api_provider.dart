// ignore_for_file: non_constant_identifier_names

import 'package:api_demo/constants.dart';
import 'package:api_demo/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProviderClass {
  static Future<List<UserModelClass>> getUserListMethod() async {
    Uri user_api = Uri.parse(userAPI);
    http.Response response = await http.get(user_api);
    if (response.statusCode == 200) {
      return userModelClassFromJson(
          jsonEncode(jsonDecode(response.body)['results']));

      //if we have just one field or one key:pair than simply
      //userModelClassFromJson(response.body);
    }
    return [];
  }
}
