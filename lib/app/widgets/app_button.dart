import 'package:flutter/material.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';

class AppButton extends StatelessWidget {
  AppColors colors = new AppColors();

  final String str;
  final VoidCallback callback;

  final bool showProgress;
  final bool outlineBtn;
  final Color color;
  final Color color2;
  final Color textColor;

  AppButton(this.str, this.callback,
      {this.showProgress = false,
      this.color = Colors.white,
      this.color2 = Colors.white,
      this.outlineBtn = true,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    final backgroundColor1 = color;
    final backgroundColor2 = color2;

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      decoration: !outlineBtn
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: colors.light),
              gradient: LinearGradient(
                colors: [backgroundColor1, backgroundColor2],
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: colors.lowLight, width: 1.5)),
      child: outlineBtn
          ? OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: showProgress
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(textColor),
                      ),
                    )
                  : Text(
                      str,
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontFamily: 'Poppins-Regular'),
                    ),
              onPressed: callback,
            )
          : FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: showProgress
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(textColor),
                      ),
                    )
                  : Text(
                      str,
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontFamily: 'Kodchasan-Regular',
                          fontWeight: FontWeight.bold),
                    ),
              onPressed: callback,
            ),
    );
  }
}
