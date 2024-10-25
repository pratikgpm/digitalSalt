import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class accountScreen extends ConsumerWidget {
  static route()=>MaterialPageRoute(builder: (context) => accountScreen(),);
  const accountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("account build print");
    return Scaffold(
      body:  Center(
        child: Text(
          "Account",
          style: TextStyle(
              color: Pallete.headingFontColr,
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),

      ),
    );
  }
}
