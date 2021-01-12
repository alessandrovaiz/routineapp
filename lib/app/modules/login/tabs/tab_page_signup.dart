import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_button_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/modules/login/login_controller.dart';
import 'package:routineapp/app/widgets/app_button.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';
import 'package:sweetalert/sweetalert.dart';

class TabPageSignUp extends StatefulWidget {
  @override
  _TabPageSignUpState createState() => _TabPageSignUpState();
}

class _TabPageSignUpState extends State<TabPageSignUp> {
  AppColors colors = new AppColors();
  LoginController controller = new LoginController();

  bool _checked = false;
  TextEditingController nam_controller;
  TextEditingController eml_controller;
  TextEditingController psw_controller;

  String name;
  String eml;
  String psw;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: TextStyle(color: colors.light),
                textAlign: TextAlign.center,
                controller: nam_controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: colors.primary,
                      fontFamily: 'Kodchasan-Regular'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: colors.lowLight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    eml = value;
                  });
                },
                style: TextStyle(color: colors.light),
                textAlign: TextAlign.center,
                controller: eml_controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: colors.primary,
                      fontFamily: 'Kodchasan-Regular'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: colors.lowLight,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  psw = value;
                });
              },
              style: TextStyle(color: colors.light),
              textAlign: TextAlign.center,
              controller: psw_controller,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: colors.primary,
                    fontFamily: 'Kodchasan-Regular'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: colors.lowLight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: AppButton(
                "Cadastrar",
                () async {
                  if (await register(name, eml, psw)) {
                    SweetAlert.show(context,
                        subtitle: 'Usuário criado com sucesso!',
                        confirmButtonText: 'Continuar',
                        cancelButtonText: 'Cancelar',
                        style: SweetAlertStyle.success,
                        confirmButtonColor: Colors.green,
                        cancelButtonColor: Colors.red, onPress: (bool ok) {
                      if (ok) {
                        Modular.to.pushNamed('/login/initial');
                      }
                    });
                  } else {
                    SweetAlert.show(
                      context,
                      subtitle: "Falha ao realizar cadastro",
                      style: SweetAlertStyle.error,
                      confirmButtonColor: colors.primary,
                    );
                  }
                },
                outlineBtn: true,
                textColor: colors.light,
              ),
            ),
          ],
        ),
      ),
    );
  }

  register(nam, eml, psw) async {
    controller.disposeUser();
    await controller.register(nam, eml, psw);
    if (controller.getuser != null) {
      return true;
    }
    return false;
  }
}
