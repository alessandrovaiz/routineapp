import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_button_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:routineapp/app/modules/login/login_controller.dart';
import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/widgets/app_button.dart';
import 'package:routineapp/app/widgets/utils/alert.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';
import 'package:sweetalert/sweetalert.dart';

class TabPageLogin extends StatefulWidget {
  @override
  _TabPageLoginState createState() => _TabPageLoginState();
}

class _TabPageLoginState extends State<TabPageLogin> {
  AppColors colors = new AppColors();
  LoginController controller = new LoginController();
  bool _checked = false;
  TextEditingController eml_controller;
  TextEditingController psw_controller;

  String psw;
  String eml;

  User user;

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
            CheckboxListTile(
              checkColor: colors.light,
              activeColor: Colors.black,
              value: _checked,
              onChanged: (bool value) {
                setState(() {
                  _checked = value;
                });
              },
              title: Text(
                "Mantenha-me conectado",
                style: TextStyle(
                    color: colors.lowLight,
                    fontSize: 14,
                    fontFamily: 'Kodchasan-Regular'),
              ),
            ),
            Observer(
                builder: (_) => controller.load
                    ? AppButton(
                        "Logar",
                        () async {
                          controller.setLoad(false);

                          if (await authenticate(eml, psw)) {
                            Modular.to.pushNamed('/login/initial',
                                arguments: controller.getuser);
                          } else {
                            SweetAlert.show(
                              context,
                              subtitle: "Falha ao realizar Login",
                              style: SweetAlertStyle.error,
                              confirmButtonColor: colors.primary,
                            );
                          }
                        },
                        outlineBtn: true,
                        textColor: colors.light,
                      )
                    : CircularProgressIndicator()),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GoogleAuthButton(
                text: "Logar com o google",
                textStyle:
                    TextStyle(fontSize: 14, fontFamily: 'Kodchasan-Regular'),
                onPressed: () {},
                darkMode: false,
                borderRadius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  authenticate(eml, psw) async {
    controller.disposeUser();
    await controller.authenticate(eml, psw);
    if (controller.getuser != null) {
      return true;
    }
    return false;
  }
}
