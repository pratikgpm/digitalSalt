import 'package:digital_salt/core/theme/theme.dart';
import 'package:digital_salt/features/controller/filterController.dart';
import 'package:digital_salt/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'features/auth/view/welcome_view.dart';
import 'features/home/view/pages/navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterProvider(),),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const navigationScreen(),
      ),
    );
  }
}

