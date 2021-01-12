import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/modules/home/home_page.dart';
import 'package:routineapp/app/modules/initial/initial_module.dart';
import 'package:routineapp/app/modules/login/login_controller.dart';
import 'package:routineapp/app/modules/login/login_page.dart';
import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  final User user;

  const CustomDrawer(@required this.user);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AppColors colors = new AppColors();

  LoginController _usercontroller = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 1.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.light, colors.light, colors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 4, color: Colors.grey[300]))),
                child: UserAccountsDrawerHeader(
                  accountEmail: Text(
                    widget.user.emlUsr,
                    style: TextStyle(
                        color: colors.primary, fontFamily: 'Kodchasan-Regular'),
                  ),
                  accountName: Text(widget.user.namUsr,
                      style: TextStyle(
                          color: colors.primary,
                          fontFamily: 'Kodchasan-Regular')),
                  currentAccountPicture: widget.user.imgUsr != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.imgUsr),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i1.wp.com/terracoeconomico.com.br/wp-content/uploads/2019/01/default-user-image.png?ssl=1'),
                        ),
                  decoration: BoxDecoration(
                      //color: Color(0xFF21BFBD),
                      color: colors.light),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home, color: colors.primary),
                  title: Text("Início",
                      style: TextStyle(
                          fontFamily: 'Kodchasan-Regular',
                          fontSize: 14.0,
                          color: colors.primary)),
                  //trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFF21BFBD)),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              ListTile(
                  leading: Icon(Icons.exit_to_app, color: colors.primary),
                  title: Text("Log-out",
                      style: TextStyle(
                          fontFamily: 'Kodchasan-Regular',
                          fontSize: 14.0,
                          color: colors.primary)),
                  //trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFF21BFBD)),
                  onTap: () {
                    print('Click');
                    _usercontroller.disposeUser();
                    Modular.to.pushReplacementNamed('/');
                    // push(context, AccessCodeScreen());
                  }),
            ],
          ),
        ));
  }
}
