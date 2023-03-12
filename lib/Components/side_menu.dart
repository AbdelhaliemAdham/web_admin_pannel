import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            DrawerListTile(
              image: 'assets/icons/menu_dashbord.svg',
              text: 'Dashboard',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_tran.svg',
              text: 'Transaction',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_task.svg',
              text: 'Task',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_doc.svg',
              text: 'Documentation',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_store.svg',
              text: 'Store',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_store.svg',
              text: 'Store',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_notification.svg',
              text: 'Notification',
              onPress: () {},
            ),
            DrawerListTile(
              image: 'assets/icons/menu_setting.svg',
              text: 'Settings',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    required this.text,
    required this.onPress,
    required this.image,
  }) : super(key: key);

  final String text;
  final VoidCallback onPress;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: SvgPicture.asset(
        image,
        height: 16,
        color: Colors.white54,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
