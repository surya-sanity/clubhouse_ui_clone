class User {
  String userName;
  String userImage;
  bool online;
  bool isMuted;
  bool isNew;
  bool isMod;
  User({
    this.userName,
    this.userImage,
    this.isMuted,
    this.isNew,
    this.online = false,
    this.isMod = false,
  });
}
