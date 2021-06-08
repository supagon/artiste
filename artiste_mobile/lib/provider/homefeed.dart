import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './homelist.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Homefeed extends ChangeNotifier {
  List<Homelist> _feed = [];
  String _id;
  var publicAPI = 'http://23.102.228.97:3000/';

  List<Homelist> get feed {
    return [..._feed];
  }

  Homelist fineById(String id) {
    return _feed.firstWhere((fed) => fed.id == id);
  }

  Future<List<Homelist>> fetchHomefeed() async {
    var endpoint = publicAPI + 'post';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data.toList();

/*       print(data.length); */
      if (data == null) return [];

      List<Homelist> fetchedHomefeed = [];

      for (int i = 0; i < data.length; i++) {
        final value = data[i];
        String temp = await getDisplayName(value['sellerId']);
        print(temp);
        fetchedHomefeed.add(Homelist(
            displayName: temp,
            id: value['id'],
            title: value['title'],
            image: value['image'],
            sellerId: value['sellerId'],
            price: value['price'],
            isAvailable: value['isAvailable'],
            sellerDonate: value['sellerDonate']));
      }
      _feed = fetchedHomefeed;
/*       print(fetchedHomefeed.length); */

      notifyListeners();
    } catch (err) {
      print(err);
      return throw (err);
    }
    return _feed;
  }

  String get id {
    return _id;
  }

  Future<String> getDisplayName(String id) async {
    var endpoint = publicAPI + 'user?id=$id';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data['displayName'].toString();

      if (data == null) return " ";

      return data;
    } catch (err) {
      print(err);
    }
  }
}
