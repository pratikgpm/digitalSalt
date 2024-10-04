import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
class messageScreen extends StatelessWidget {
  const messageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "Message",
          style: TextStyle(
              color: Pallete.headingFontColr,
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),
      ),
    );
  }
}
