import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class Auth with ChangeNotifier {
  String _id;
  var publicAPI = 'http://23.102.228.97:3000/';

  bool get isAuth {
    return _id != null;
  }

  String get id {
    return _id;
  }

  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String displayname,
  ) async {
    var endpoint = publicAPI + 'register';
    print(firstName);
    print(lastName);
    print(email);
    print(password);
    print(displayname);
    try {
      final res = await Dio().post((endpoint), data: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'displayName': displayname,
      });
      print(res.data['id']);
      print(res.statusCode);
      final data = res.data;
      print(data);
      if (data == null) return;

      if (res.statusCode == 201) {
        _id = data['id'];
        print(_id);
      } else if (res.statusCode == 400) {
        print('Something went wrong. Please Try Again');
      }

      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<bool> login(String email, String password) async {
    var endpoint = publicAPI + 'login';
    try {
      final res = await Dio()
          .post((endpoint), data: {"email": email, "password": password});

      final data = (res.data);

      if (res.statusCode == 400) return false;

      _id = data['id'];

      final prefs = await SharedPreferences.getInstance();
      final user = json.encode({'id': _id});
      print(user);

      prefs.setString('user', user);

      notifyListeners();

      return true;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('user')) return false;
    final user = json.decode(prefs.getString('user'));
    _id = user['id'];
    notifyListeners();

    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _id = null;
    prefs.clear();
    notifyListeners();
  }
}
