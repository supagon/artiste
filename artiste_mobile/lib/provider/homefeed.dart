import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './homelist.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Homefeed extends ChangeNotifier {
  List<Homelist> _feed = [];
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

      if (data == null) return [];

      final List<Homelist> fetchedHomefeed = [];
      data.forEach((value) {
        fetchedHomefeed.add(Homelist(
            id: value['id'],
            title: value['title'],
            image: value['image'],
            sellerId: value['sellerId'],
            price: value['price'],
            isAvailable: value['isAvailable'],
            sellerDonate: value['sellerDonate']));
      });
      _feed = fetchedHomefeed;
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
    return _feed;
  }
}
