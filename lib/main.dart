import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_admin_pannel/Screens/menu_screen.dart';
import 'package:web_admin_pannel/constants.dart';
import 'package:web_admin_pannel/controllers/MenuAppController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MenuScreen(),
      ),
    );
  }
}
