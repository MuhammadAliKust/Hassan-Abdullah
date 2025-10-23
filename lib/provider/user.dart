import 'package:flutter/material.dart';
import 'package:hassan_abdullah_apis/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel _model = UserModel();

  void setUser(UserModel model) {
    _model = model;
    notifyListeners();
  }

  UserModel getUser() => _model;
}
