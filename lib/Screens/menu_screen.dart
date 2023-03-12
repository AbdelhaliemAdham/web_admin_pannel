import 'dart:js';

import 'package:flutter/material.dart';
import 'package:web_admin_pannel/Screens/dashboard_screen.dart';
import 'package:web_admin_pannel/controllers/MenuAppController.dart';
import 'package:web_admin_pannel/responsive.dart';
import 'package:provider/provider.dart';

import '../Components/side_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const SideMenu(),
            const Expanded(
              flex: 5,
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
