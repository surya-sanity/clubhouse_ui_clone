import 'package:cbh_ui_clone/models/models.dart';
import 'package:cbh_ui_clone/sources/size_config.dart';
import 'package:cbh_ui_clone/sources/sources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens.dart';

class RoomScreen extends StatefulWidget {
  RoomScreen({this.roomData});
  final Room roomData;
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.sidePadding,
                    ),
                    child: Container(
                      height: SizeConfig.longside / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: SizeConfig.longside / 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Hallway",
                                  style: h4SemiBold,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: SizeConfig.longside / 33,
                                  height: SizeConfig.longside / 33,
                                  child: SvgPicture.asset(
                                    "assets/icons/openLinkIcon.svg",
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(22, 0, 15, 0),
                                child: Container(
                                  height: SizeConfig.longside / 24,
                                  width: SizeConfig.longside / 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pexels1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ScrollConfiguration(
                        behavior: DefaultScrollBehavior(),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        (widget.roomData.clubName)
                                            .toUpperCase(),
                                        style: h5SemiBold.copyWith(
                                            wordSpacing: 1.5,
                                            letterSpacing: 1.5),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Icon(
                                          Icons.home_filled,
                                          color: cbGreen,
                                          size: SizeConfig.longside / 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.more_horiz,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.longside * 0.003,
                              ),
                              Text(
                                widget.roomData.roomName,
                                style: h3SemiBold,
                              ),
                              SizedBox(
                                height: SizeConfig.longside * 0.02,
                              ),
                              speakersZone(),
                              SizedBox(
                                height: SizeConfig.longside * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Followed by Speakers',
                                  style: h4SemiBold.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.longside * 0.02,
                              ),
                              followedBySpeakersZone(),
                              SizedBox(
                                height: SizeConfig.longside * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Others in the room',
                                  style: h4SemiBold.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.longside * 0.02,
                              ),
                              followedBySpeakersZone(),
                              SizedBox(
                                height: SizeConfig.longside / 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.0),
        height: SizeConfig.longside / 9,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: leaveQuietly(),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(CupertinoIcons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.hand_raised,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container leaveQuietly() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      height: SizeConfig.longside / 20,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "✌🏻 ", style: h3),
              TextSpan(
                text: " Leave quietly",
                style: h4Bold.copyWith(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget speakersZone() {
    return ScrollConfiguration(
      behavior: DefaultScrollBehavior(),
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        children: List.generate(userData.length, (index) {
          return Column(
            children: [
              Stack(
                children: [
                  clubHouseAvatar(
                    size: SizeConfig.longside / 10,
                    image: userData[index].userImage,
                  ),
                  if (userData[index].isNew)
                    Positioned(
                      bottom: 2,
                      left: 2,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 5.0,
                              ),
                            ]),
                        child: Text("🎉"),
                      ),
                    ),
                  if (userData[index].isMuted)
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 5.0,
                              ),
                            ]),
                        child: Icon(
                          CupertinoIcons.mic_slash_fill,
                          size: SizeConfig.longside / 45,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: SizeConfig.longside / 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (userData[index].isMod)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        height: SizeConfig.longside / 55,
                        width: SizeConfig.longside / 55,
                        child:
                            SvgPicture.asset('assets/icons/moderatorIcon.svg'),
                      ),
                    ),
                  Text(
                    userData[index].userName,
                    style: h4SemiBold,
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  Widget followedBySpeakersZone() {
    return ScrollConfiguration(
      behavior: DefaultScrollBehavior(),
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 20,
        crossAxisCount: 4,
        children: List.generate(userData.length, (index) {
          return Container(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.passthrough,
                    children: [
                      clubHouseAvatar(
                        size: SizeConfig.longside / 14,
                        image: userData[index].userImage,
                      ),
                      if (userData[index].isNew)
                        Positioned(
                          bottom: 2,
                          left: 2,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 5.0,
                                  ),
                                ]),
                            child: Text("🎉"),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    userData[index].userName,
                    style: h4SemiBold,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
