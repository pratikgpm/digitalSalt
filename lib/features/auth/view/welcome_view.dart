import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:digital_salt/features/auth/view/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_page.dart';
import '../../../core/widget/customButton.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 617.25,
          width: 335.25,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg_files/welcome.svg",
                    height: 260,
                    width: 260,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 38),
                    height: 66,
                    width: 192,
                    child: const Text(
                      "Create your own study plan",
                      style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Pallete.headingFontColr,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 72,
                    width: 190,
                    margin: const EdgeInsets.only(top: 18),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Study according to the study plan, make study more motivated",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Pallete.regFontColr),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 112.75),
                      height: 50.5,
                      width: 335.25,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: customButton(
                                title: "Sign up",
                                onPressed: () {
                                  Navigator.push(context, signupView.route());
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14.75,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: customButton(
                                isInverse: true,
                                title: "Log in",
                                onPressed: () {
                                  Navigator.push(context, loginView.route());
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
