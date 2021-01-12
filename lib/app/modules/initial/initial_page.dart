import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/modules/initial/tasks/tasks_page.dart';

import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/widgets/app_button.dart';
import 'package:routineapp/app/widgets/drawer.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';
import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  final User user;
  final String title;
  const InitialPage({Key key, this.title = "Initial", @required this.user})
      : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  //use 'controller' variable to access controller
  AppColors colors = new AppColors();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InitialController _initialController = new InitialController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(widget.user),
        backgroundColor: colors.primary,
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: Observer(builder: (_) {
          return Column(
            children: <Widget>[
              _buildTitle(),
              _buildTopButtons(),
              TasksPage(user: widget.user, option: _initialController.option)
            ],
          );
        }),
      ),
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: colors.lowLight,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer()),
                Text("Dashboard",
                    style: TextStyle(
                        fontSize: 16,
                        color: colors.light,
                        fontFamily: 'Kodchasan-Regular')),
              ],
            ),
            CircleAvatar()
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: Text(
            "Olá,",
            style: TextStyle(
                fontSize: 32,
                color: colors.light,
                fontFamily: 'Kodchasan-Regular'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(widget.user.namUsr,
              style: TextStyle(
                  fontSize: 32,
                  color: colors.light,
                  fontFamily: 'Kodchasan-Regular')),
        )
      ],
    );
  }

  _buildTopButtons() {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: AppButton(
                    "Ver tudo",
                    () {
                      _initialController.changeOption(0);
                    },
                    outlineBtn: false,
                    color: _initialController.option == 0
                        ? colors.light
                        : colors.lowLight,
                    color2: _initialController.option == 0
                        ? colors.light
                        : colors.lowLight,
                    textColor: colors.primary,
                  )),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.06,
                child: AppButton(
                  "Dia",
                  () {
                    _initialController.changeOption(1);
                  },
                  outlineBtn: false,
                  color: _initialController.option == 1
                      ? colors.light
                      : colors.lowLight,
                  color2: _initialController.option == 1
                      ? colors.light
                      : colors.lowLight,
                  textColor: colors.primary,
                )),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
