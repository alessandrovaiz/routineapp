import 'package:dio/dio.dart';
import 'package:routineapp/app/modules/login/login_controller.dart';

LoginController controller = new LoginController();

class User {
  int idUsr;
  String namUsr;
  String emlUsr;
  String imgUsr;

  User({this.idUsr, this.namUsr, this.emlUsr, this.imgUsr});

  void disposeUser() {
    controller.disposeUser();
  }

  User.fromJson(Map<String, dynamic> json)
      : idUsr = json['id_usr'],
        namUsr = json['nam_usr'],
        emlUsr = json['eml_usr'],
        imgUsr = json['img_usr'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_usr'] = this.idUsr;
    data['nam_usr'] = this.namUsr;
    data['eml_usr'] = this.emlUsr;
    data['img_usr'] = this.imgUsr;
    return data;
  }
}
