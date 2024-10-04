import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "Search",
          style: TextStyle(
              color: Pallete.headingFontColr,
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),
      ),
    );;
  }
}
