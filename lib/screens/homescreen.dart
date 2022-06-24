import 'dart:math';
import 'package:cbh_ui_clone/sources/sources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Random random = new Random();

  TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: chAppBar(),
      body: TabBarView(
        controller: tabController,
        children: [
          Hallway(),
          UserList(),
        ],
      ),
    );
  }

  AppBar chAppBar() {
    return AppBar(
      elevation: 0.0,
      leadingWidth: double.infinity,
      backgroundColor: Colors.transparent,
      leading: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.sidePadding),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: SizeConfig.longside / 23,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                    height: SizeConfig.longside / 30,
                    width: SizeConfig.longside / 30,
                    child: SvgPicture.asset('assets/icons/invitesIcon.svg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                    height: SizeConfig.longside / 30,
                    width: SizeConfig.longside / 30,
                    child: SvgPicture.asset('assets/icons/calendarIcon.svg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                    height: SizeConfig.longside / 30,
                    width: SizeConfig.longside / 30,
                    child: SvgPicture.asset('assets/icons/bellIcon.svg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: SizeConfig.longside / 24,
                  width: SizeConfig.longside / 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                      image: AssetImage('assets/images/pexels1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
