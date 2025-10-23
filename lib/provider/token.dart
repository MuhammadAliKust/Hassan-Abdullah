import 'package:flutter/material.dart';

class ToeknProvider extends ChangeNotifier{
  String _token = "";

  void setToken(String token){
    _token = token;
    notifyListeners();
  }


  String getToken()=>_token;
}