import 'dart:convert';

import 'package:hassan_abdullah_apis/models/login.dart';
import 'package:hassan_abdullah_apis/models/register.dart';
import 'package:hassan_abdullah_apis/models/user.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String todoURL = "https://todo-nu-plum-19.vercel.app";

  ///Register
  Future<RegisterModel> registerUser({
    required String name,
    required String email,
    required String pwd,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$todoURL/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"name": name, "email": email, "password": pwd}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Login
  Future<LoginModel> loginUser({
    required String email,
    required String pwd,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$todoURL/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": pwd}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Get Profile
  Future<UserModel> getProfile(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$todoURL/users/profile'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Update Profile
  Future<bool> updateProfile({
    required String name,
    required String token,
  }) async {
    try {
      http.Response response = await http.put(
        Uri.parse('$todoURL/users/profile'),
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
