import 'package:flutter/material.dart';

import 'package:web_admin_pannel/Screens/dashboard_screen.dart';

class GridViewSction extends StatelessWidget {
  const GridViewSction({
    Key? key,
    this.childAspectRatio = 1,
    this.crossAxisCount = 4,
  }) : super(key: key);
  final double childAspectRatio;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 6,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) {
        List<String> listImages = [
          'assets/icons/Documents.svg',
          'assets/icons/google_drive.svg',
          'assets/icons/one_drive.svg',
          'assets/icons/doc_file.svg',
        ];

        List<String> listNames = [
          'Documents',
          'Googel Drive',
          'One Drive',
          'Documents'
        ];
        List<Color> colors = const [
          Color(0xff0378C8),
          Color(0xffF89A00),
          Color(0xff91C2F0),
          Color(0xff0378C8),
        ];
        return StorageSection(
          image: listImages[index],
          text: listNames[index],
          color: colors[index],
        );
      },
    );
  }
}
