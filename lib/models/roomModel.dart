import 'package:cbh_ui_clone/models/usermodel.dart';

class Room {
  String clubName;
  String roomName;
  List<User> userList;
  num listenerCount;
  num speakerCount;

  Room({
    this.clubName,
    this.roomName,
    this.userList,
    this.listenerCount,
    this.speakerCount,
  });
}
