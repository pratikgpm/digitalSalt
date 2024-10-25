import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';

class messageScreen extends ConsumerWidget {
  const messageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("message build print");


    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            "Message",
            style: TextStyle(
                color: Pallete.headingFontColr,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),

        ),
      ),
    );
  }
}
