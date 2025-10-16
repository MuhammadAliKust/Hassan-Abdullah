import 'dart:convert';

import 'package:hassan_abdullah_apis/models/task.dart';
import 'package:hassan_abdullah_apis/models/task_listing.dart';
import 'package:http/http.dart' as http;

class TaskServices {
  String todoURL = "";

  ///Create Task
  Future<TaskModel> createTask({
    required String token,
    required String description,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$todoURL/todos/add'),
        headers: {'Content-Type': 'application/json', 'Authorization': token},
        body: jsonEncode({"description": description}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Get All Task
  Future<TaskListingModel> getAllTask(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$todoURL/todos/get'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListingModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Get Completed Task
  Future<TaskListingModel> getCompletedTask(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$todoURL/todos/completed'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListingModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Get InCompleted Task
  Future<TaskListingModel> getInCompletedTask(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$todoURL/todos/incomplete'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListingModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
