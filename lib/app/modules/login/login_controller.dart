import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/shared/utils/constants.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';
import 'package:http/http.dart' as http;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AppColors colors = new AppColors();

  @observable
  int option = 0;

  @observable
  User user;

  @observable
  bool load = true;

  @computed
  User get getuser => user;

  //seta para login ou cadastro
  @action
  void setOption(int option) {
    this.option = option;
  }

  @action
  void setLoad(bool status) {
    load = status;
  }

  @action
  Future<User> authenticate(String email, String password) async {
    try {
      String url = Constants.api + '/authenticate';
      print(url);

      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'eml_usr': email,
            'psw_usr': password,
          }));

      var decodeJson = jsonDecode(response.body);
      print(decodeJson['user']);
      user = User.fromJson(decodeJson['user']);
      this.user = user;
      setLoad(true);
      return user;
    } catch (error) {
      setLoad(true);
      print("Failed to load the user");
      return null;
    }
  }

  @action
  Future<User> register(String name, String email, String password) async {
    try {
      String url = Constants.api + '/register';
      print(url);

      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'nam_usr': name,
            'eml_usr': email,
            'psw_usr': password,
          }));

      var decodeJson = jsonDecode(response.body);
      print(decodeJson['user']);
      user = User.fromJson(decodeJson['user']);
      String token = decodeJson['token'];
      print(token);
      this.user = user;
      setLoad(true);
      return user;
    } catch (error) {
      setLoad(true);
      print("Failed to register the user");
      return null;
    }
  }

  @action
  void disposeUser() {
    this.user = null;
  }
}
