import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:routineapp/app/modules/login/tabs/tab_page_login.dart';
import 'package:routineapp/app/modules/login/tabs/tab_page_signup.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController>
    with SingleTickerProviderStateMixin<LoginPage> {
  //use 'controller' variable to access controller

  AppColors colors = new AppColors();
  final controller = LoginController();
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    controller.disposeUser();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();

      tabController = TabController(length: 2, vsync: this);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colors.primary,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: colors.light),
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style:
              TextStyle(color: Colors.white, fontFamily: 'Kodchasan-Regular'),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: colors.primary,
                border: Border(
                    bottom: BorderSide(width: 3, color: colors.lowLight)),
              ),
              height: height * 0.4,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Icon(
                      Icons.login,
                      size: 50,
                      color: colors.light,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Organize a sua vida.",
                      style: TextStyle(
                          color: colors.lowLight,
                          fontFamily: 'Kodchasan-Regular'),
                    ),
                  )
                ],
              )),
          Container(
            height: height * 0.6,
            width: width,
            color: colors.primary,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) => GestureDetector(
                          child: Text(
                            "Faça Login ",
                            style: controller.option == 0
                                ? TextStyle(
                                    color: colors.light,
                                    fontFamily: 'Kodchasan-Regular')
                                : TextStyle(
                                    color: colors.lowLight,
                                    fontFamily: 'Kodchasan-Regular'),
                          ),
                          onTap: () {
                            controller.setOption(0);
                          },
                        ),
                      ),
                      Text(
                        "ou ",
                        style: TextStyle(
                            color: colors.lowLight,
                            fontFamily: 'Kodchasan-Regular'),
                      ),
                      Observer(
                          builder: (_) => GestureDetector(
                                child: Text(
                                  "Cadastre-se",
                                  style: controller.option == 1
                                      ? TextStyle(
                                          color: colors.light,
                                          fontFamily: 'Kodchasan-Regular')
                                      : TextStyle(
                                          color: colors.lowLight,
                                          fontFamily: 'Kodchasan-Regular'),
                                ),
                                onTap: () {
                                  controller.setOption(1);
                                },
                              )),
                    ],
                  ),
                ),
                Observer(
                    builder: (_) => AnimatedCrossFade(
                        crossFadeState: controller.option == 0
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 500),
                        firstChild: TabPageLogin(),
                        secondChild: TabPageSignUp())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
