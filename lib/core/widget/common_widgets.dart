import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:digital_salt/core/widget/customButton.dart';
import 'package:digital_salt/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class commonWidgets{
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(right: 16, left: 16, top: 48),
          backgroundColor: Pallete.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
              height: 167,
              width: 259,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg_files/sucess.svg',
                    height: 64,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Success",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallete.headingFontColr),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const SizedBox(
                    height: 36,
                    width: 172,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Congratulations, you have\ncompleted your registration!",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Pallete.regFontColr),
                    ),
                  )
                ],
              )),
          actions: <Widget>[
            customButton(
              title: "Done",
              onPressed: () {
                Navigator.pushReplacement(context, loginView.route());
              },
            ),
          ],
        );
      },
    );
  }
}
