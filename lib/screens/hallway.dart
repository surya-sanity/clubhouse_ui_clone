import 'package:cbh_ui_clone/models/models.dart';
import 'package:cbh_ui_clone/screens/room_screen.dart';
import 'package:cbh_ui_clone/screens/screens.dart';
import 'package:cbh_ui_clone/sources/sources.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Hallway extends StatefulWidget {
  @override
  _HallwayState createState() => _HallwayState();
}

class _HallwayState extends State<Hallway> {
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000))
        .then((value) => DoNothingAction());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.sidePadding),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: DefaultScrollBehavior(),
                    child: RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: hallWayData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                showGeneralDialog(
                                    barrierDismissible: false,
                                    transitionDuration: Duration(
                                      milliseconds: 300,
                                    ),
                                    context: context,
                                    transitionBuilder:
                                        (context, anim1, anim2, child) {
                                      return SlideTransition(
                                        position: Tween(
                                                begin: Offset(0, 1),
                                                end: Offset(0, 0))
                                            .animate(anim1),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, _, __) {
                                      return RoomScreen(
                                        roomData: hallWayData[index],
                                      );
                                    });
                              },
                              child: index == hallWayData.length - 1
                                  ? SizedBox(
                                      height: SizeConfig.longside / 10,
                                    )
                                  : roomCard(room: hallWayData[index]));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: DelayedDisplay(
        delay: Duration(milliseconds: 250),
        fadingDuration: Duration(milliseconds: 250),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 2),
          height: SizeConfig.longside / 8,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.5, 0.9],
              colors: [
                Colors.white.withOpacity(.9),
                Colors.white.withOpacity(.1)
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth / 5,
                height: SizeConfig.longside / 20,
              ),
              Container(
                height: SizeConfig.longside / 15,
                width: SizeConfig.screenWidth / 2,
                decoration: BoxDecoration(
                  color: cbGreen,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: SizeConfig.longside / 35,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Start a room",
                        style: h3SemiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: SizeConfig.longside / 25,
                  width: SizeConfig.longside / 25,
                  child: SvgPicture.asset('assets/icons/userListIcon.svg'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding roomCard({Room room}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: AnimatedContainer(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  (room.clubName).toUpperCase(),
                  style:
                      h5SemiBold.copyWith(wordSpacing: 1.5, letterSpacing: 1.5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Icon(
                    Icons.home_filled,
                    color: cbGreen,
                    size: SizeConfig.longside / 50,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                room.roomName,
                style: h3SemiBold.copyWith(height: 1.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: SizeConfig.longside / 9,
                      maxHeight: SizeConfig.longside / 9,
                      minWidth: SizeConfig.screenWidth / 4,
                      maxWidth: SizeConfig.screenWidth / 4,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: SizeConfig.longside / 28,
                          left: SizeConfig.longside / 25,
                          child: clubHouseAvatar(
                            size: SizeConfig.longside / 14,
                            image: room.userList[0].userImage,
                          ),
                        ),
                        Positioned(
                          child: clubHouseAvatar(
                            size: SizeConfig.longside / 14,
                            image: room
                                .userList[room.userList.length - 1].userImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: room.userList.length > 4
                                ? 4
                                : room.userList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  children: [
                                    Text(
                                      room.userList[index].userName,
                                      style: h3SemiBold.copyWith(height: 1.2),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: whiteChatHead(
                                          SizeConfig.longside / 55),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  (room.listenerCount).toString(),
                                  style:
                                      h5SemiBold.copyWith(color: Colors.grey),
                                ),
                                Icon(
                                  Icons.person,
                                  size: SizeConfig.longside / 55,
                                  color: Colors.grey,
                                ),
                                Text(
                                  " / ",
                                  style: h6,
                                ),
                                Text(
                                  (room.speakerCount).toString(),
                                  style:
                                      h5SemiBold.copyWith(color: Colors.grey),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.0),
                                  child: greyChatHead(SizeConfig.longside / 70),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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

  SizedBox whiteChatHead(size) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        "assets/icons/whiteChathead.svg",
      ),
    );
  }

  SizedBox greyChatHead(size) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        "assets/icons/greyChathead.svg",
      ),
    );
  }
}

clubHouseAvatar({@required double size, @required String image}) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        size / 2 - size / 16,
      ),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}
