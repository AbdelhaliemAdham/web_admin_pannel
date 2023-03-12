import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_admin_pannel/Components/side_menu.dart';
import 'package:web_admin_pannel/Model/RecentFile.dart';

import 'package:web_admin_pannel/constants.dart';
import 'package:web_admin_pannel/controllers/MenuAppController.dart';
import 'package:web_admin_pannel/responsive.dart';

import '../Components/gridview_sction.dart';
import '../Components/pie_chart.dart';
import '../Components/profile_card.dart';
import '../Components/search_field.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding * 0.5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'My Files',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.add),
                                  Text(
                                    'Add New',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Responsive(
                        mobile: GridViewSction(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                        ),
                        desktop: GridViewSction(
                          childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        margin:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff2A2D3E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Recent Files',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            DataTable(
                              dataRowHeight: 40,
                              dividerThickness: 1,
                              columns: const [
                                DataColumn(
                                  label: Text('File Name'),
                                ),
                                DataColumn(
                                  label: Text('Data'),
                                ),
                                DataColumn(
                                  label: Text('Size'),
                                ),
                              ],
                              rows: List.generate(
                                demoRecentFiles.length,
                                (index) => DataRowWidget(
                                  demoRecentFiles[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding * 0.8),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  DataRow DataRowWidget(RecentFile recentFile) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                recentFile.icon ?? '',
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(recentFile.title ?? ''),
              ),
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              Text(recentFile.date ?? ''),
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              Text(
                recentFile.size ?? '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 10, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Storage details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                const PieChartWidget(),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '29.53',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                      ),
                      const Text(
                        'Of 125 Gb',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ContainerFile(
            text1: 'Documnets Files ',
            text2: '1234 files',
            text3: '8.5 Gb',
            imageData: 'assets/icons/Documents.svg',
          ),
          const ContainerFile(
            text1: 'Media Files ',
            text2: '1416 files',
            text3: '4.4 Gb',
            imageData: 'assets/icons/media.svg',
          ),
          const ContainerFile(
            text1: 'Other Files ',
            text2: '1734 files',
            text3: '5.6 Gb',
            imageData: 'assets/icons/folder.svg',
          ),
          const ContainerFile(
            text1: 'Unknown Files ',
            text2: '23442 files',
            text3: '5.9 Gb',
            imageData: 'assets/icons/unknown.svg',
          ),
        ],
      ),
    );
  }
}

class StorageSection extends StatelessWidget {
  const StorageSection({
    Key? key,
    required this.image,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String image;
  final String text;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff273754),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgPicture.asset(
                      image,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Color(0xff9D9FA6),
                  ),
                ],
              ),
            ),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xff263652),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '1324 Files',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    '1.9 Gb',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerFile extends StatelessWidget {
  const ContainerFile({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.imageData,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final String imageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff253C5B),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(imageData),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                )
              ],
            ),
          ),
          Text(text3)
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => context.read<MenuAppController>().controlMenu()),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        const Expanded(
          child: SearchField(),
        ),
        const ProfileCart(),
      ],
    );
  }
}
