import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/shared/utils/constants.dart';
import 'package:http/http.dart' as http;
part 'api_store.g.dart';

class ApiStore = _ApiStoreBase with _$ApiStore;

abstract class _ApiStoreBase with Store {
  @observable
  User user;

  @action
  authenticate(String email, String password) {}

  Future<User> getUser(String email, String password) async {
    try {
      String url = Constants.api + '/authenticate';

      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'eml_usr': email,
            'psw_usr': password,
          }));

      print(response.body);
    } catch (error) {}
  }
}
