import 'package:cbh_ui_clone/models/roomModel.dart';
import 'package:cbh_ui_clone/models/usermodel.dart';

List<User> userData = [
  User(
    userImage: 'assets/images/pexels1.jpg',
    userName: 'depp',
    isMuted: false,
    isNew: false,
    isMod: true,
  ),
  User(
    userImage: 'assets/images/pexels2.jpg',
    userName: 'stallone',
    isMuted: false,
    isNew: true,
    online: true,
    isMod: true,
  ),
  User(
    userImage: 'assets/images/pexels3.jpg',
    userName: 'steele',
    isMuted: true,
    isNew: false,
    online: true,
  ),
  User(
    userImage: 'assets/images/pexels4.jpg',
    userName: 'pepper',
    isMuted: false,
    isNew: false,
  ),
  User(
    userImage: 'assets/images/pexels5.jpg',
    userName: 'amy',
    isMuted: false,
    isNew: true,
  ),
  User(
    userImage: 'assets/images/pexels6.jpg',
    userName: 'kraken',
    isMuted: false,
    online: true,
    isNew: false,
  ),
  User(
    userImage: 'assets/images/pexels7.jpg',
    userName: 'black',
    isMuted: true,
    isNew: true,
    online: true,
  ),
  User(
    userImage: 'assets/images/pexels8.jpg',
    userName: 'jumper',
    isMuted: false,
    isNew: false,
  ),
  User(
    userImage: 'assets/images/pexels9.jpg',
    userName: 'peter',
    isMuted: false,
    isNew: false,
  ),
  User(
    userImage: 'assets/images/pexels10.jpg',
    userName: 'suruli',
    isMuted: true,
    online: true,
    isNew: true,
  ),
  User(
    userImage: 'assets/images/pexels11.jpg',
    userName: 'depressed',
    isMuted: true,
    online: true,
    isNew: false,
  ),
];

List<Room> hallWayData = [
  Room(
    clubName: 'Traders club',
    roomName: 'How to invest 🚀🚀',
    userList: [
      User(
        userImage: 'assets/images/pexels1.jpg',
        userName: 'depp',
      ),
      User(
        userImage: 'assets/images/pexels2.jpg',
        userName: 'stallone',
      ),
      User(
        userImage: 'assets/images/pexels3.jpg',
        userName: 'steele',
      ),
    ],
    listenerCount: 150,
    speakerCount: 10,
  ),
  Room(
    clubName: 'Random acts of kindness',
    roomName: '❤ Yes kind humans are here ❤',
    userList: [
      User(
        userImage: 'assets/images/pexels6.jpg',
        userName: 'kraken',
      ),
      User(
        userImage: 'assets/images/pexels7.jpg',
        userName: 'black',
      ),
      User(
        userImage: 'assets/images/pexels8.jpg',
        userName: 'jumper',
      ),
    ],
    listenerCount: 200,
    speakerCount: 2,
  ),
  Room(
    clubName: 'F** Society',
    roomName: 'Anonymous',
    userList: [
      User(
        userImage: 'assets/images/pexels4.jpg',
        userName: 'pepper',
      ),
      User(
        userImage: 'assets/images/pexels5.jpg',
        userName: 'amy',
      ),
      User(
        userImage: 'assets/images/pexels6.jpg',
        userName: 'kraken',
      ),
    ],
    listenerCount: 8000,
    speakerCount: 302,
  ),
  Room(
    clubName: 'Life ethics',
    roomName: 'Come and learn yourselves',
    userList: [
      User(
        userImage: 'assets/images/pexels9.jpg',
        userName: 'peter',
      ),
      User(
        userImage: 'assets/images/pexels11.jpg',
        userName: 'depressed',
      ),
      User(
        userImage: 'assets/images/pexels10.jpg',
        userName: 'suruli',
      ),
    ],
    listenerCount: 500,
    speakerCount: 12,
  ),
  Room(
    clubName: 'lofi 24/7',
    roomName: 'peace 😊',
    userList: [
      User(
        userImage: 'assets/images/pexels1.jpg',
        userName: 'depp',
      ),
      User(
        userImage: 'assets/images/pexels2.jpg',
        userName: 'stallone',
      ),
      User(
        userImage: 'assets/images/pexels3.jpg',
        userName: 'steele',
      ),
    ],
    listenerCount: 100,
    speakerCount: 40,
  ),
  Room(
    clubName: 'Traders club',
    roomName: 'How to invest ❤❤',
    userList: [
      User(
        userImage: 'assets/images/pexels7.jpg',
        userName: 'damn',
      ),
      User(
        userImage: 'assets/images/pexels1.jpg',
        userName: 'stallone',
      ),
      User(
        userImage: 'assets/images/pexels3.jpg',
        userName: 'steele',
      ),
    ],
    listenerCount: 5000,
    speakerCount: 30,
  ),
  Room(
    clubName: 'foodies assemble',
    roomName: 'How much you love food ?',
    userList: userData,
    listenerCount: 10,
    speakerCount: 5,
  ),
];
