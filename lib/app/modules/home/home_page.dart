import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/widgets/app_button.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: _buildBody(width, height));
  }

  Container _buildBody(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/home_background.jpg"),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Routine App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Kodchasan-Regular'),
              ),
            ),
            SizedBox(
              height: height * 0.6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Routine APP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Kodchasan-Regular'),
              ),
            ),
            Container(
              width: width * 0.7,
              child: Text(
                "Seja bem vindo ao app de Rotinas, aqui você pode organizar tudo o que precisa para sua semana ser produtiva!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Kodchasan-Regular'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: AppButton(
                "Começar",
                () {
                  Modular.to.pushNamed("/login");
                },
                outlineBtn: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
