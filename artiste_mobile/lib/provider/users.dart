import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './homelist.dart';

class Users extends ChangeNotifier {
  List<String> _images = [];
  String _id;
  String _displayname = "";
  var publicAPI = 'http://23.102.228.97:3000/';

  // List<Homelist> get profile {
  //   return [..._images];
  // }

  // Homelist fineById(String id) {
  //   return _profile.firstWhere((pro) => pro.id == id);
  // }

  String get id {
    return _id;
  }

  String get displayname {
    return _displayname;
  }

  List<String> get images {
    return _images;
  }

  Future<void> getUserImages() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('user')) {
      return [];
    }
    ;
    final user = json.decode(prefs.getString('user'));
    _id = user['id'];
    var endpoint = publicAPI + 'post';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data.toList();
      List<String> temp = [];
      data.forEach((el) => {if (el["sellerId"] == _id) temp.add(el["image"])});
      _images = temp;

      notifyListeners();
    } catch (err) {
      print(err);
      return throw (err);
    }
  }

  Future<void> getDisplayNameInfo() async {
    var endpoint = publicAPI + 'user?id=$id';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data['displayName'].toString();
      _displayname = data;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
