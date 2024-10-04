import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class accountScreen extends StatelessWidget {
  const accountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "Accout",
          style: TextStyle(
              color: Pallete.headingFontColr,
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),
      ),
    );
  }
}
