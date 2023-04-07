import 'package:flutter/cupertino.dart';

class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname,this.level);
}

class UserInfoModel extends ChangeNotifier{

  UserInfo _user=UserInfo("shen",19);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}