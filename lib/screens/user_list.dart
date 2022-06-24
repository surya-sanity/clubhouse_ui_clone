import 'dart:math';

import 'package:cbh_ui_clone/screens/hallway.dart';
import 'package:cbh_ui_clone/sources/default_scrollbehavior.dart';
import 'package:cbh_ui_clone/sources/sampledata.dart';
import 'package:cbh_ui_clone/sources/size_config.dart';
import 'package:cbh_ui_clone/sources/styles.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000))
        .then((value) => DoNothingAction());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.sidePadding),
      child: Container(
        color: bgcolor,
        width: SizeConfig.screenWidth / 3,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.longside / 50,
            ),
            Row(
              children: [
                Text(
                  ("available to chat").toUpperCase(),
                  style: h4SemiBold.copyWith(color: Colors.black54),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 0.5,
                      decoration: BoxDecoration(color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.longside / 50),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: DefaultScrollBehavior(),
                      child: RefreshIndicator(
                        triggerMode: RefreshIndicatorTriggerMode.anywhere,
                        onRefresh: _handleRefresh,
                        child: ListView.builder(
                          itemCount: userData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5.0,
                              ),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            clubHouseAvatar(
                                              size: SizeConfig.longside / 15,
                                              image: userData[index].userImage,
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 5,
                                              child: Container(
                                                height:
                                                    SizeConfig.longside / 65,
                                                width: SizeConfig.longside / 65,
                                                decoration: BoxDecoration(
                                                  color: userData[index].online
                                                      ? cbGreen
                                                      : Colors.green.shade100,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                userData[index].userName,
                                                style: h4SemiBold,
                                              ),
                                              SizedBox(
                                                  height:
                                                      SizeConfig.longside / 80),
                                              Text(
                                                userData[index].online
                                                    ? 'Online'
                                                    : '${(Random().nextInt(60).toString())}m',
                                                style: h5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: SizeConfig.longside / 22,
                                      width: SizeConfig.screenWidth / 4,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xffE8FCD9,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: SizeConfig.longside / 45,
                                            color: cbGreen,
                                          ),
                                          Text(
                                            'Room',
                                            style: h5SemiBold.copyWith(
                                              color: cbGreen,
                                            ),
                                          ),
                                          Icon(
                                            Icons.lock,
                                            size: SizeConfig.longside / 65,
                                            color: cbGreen,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
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
    );
  }
}
