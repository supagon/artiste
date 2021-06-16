import 'package:artiste_mobile/provider/homelist.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:async';

class postdetail {
  final String id;
  final String image;
  final String title;
  final String postId;
  final String price;
  final bool sellerDonate;
  final String sellerId;
  final String displayName;
  postdetail(
      {this.id,
      this.image,
      this.title,
      this.postId,
      this.price,
      this.sellerDonate,
      this.sellerId,
      this.displayName
      });
}

class Getpostinfo extends ChangeNotifier {
  List<postdetail> postcard = [];
  var publicAPI = 'http://23.102.228.97:3000/';

  Future<List<postdetail>> getpostinfo(String id) async {
/*     final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('post')) return [];
    final post = json.decode(prefs.getString('post'));
    _id = post['id'];  */
    var endpoint = publicAPI + "post/info?id=$id";
    try {
      final res = await Dio().get(endpoint);
      List data = [res.data];
      List<postdetail> temp = [];

      for (int i = 0; i < data.length; i++) {
        final element = data[i];
        String displayName = await getDisplayName(element['sellerId']);
        /* print(temp); */
        temp.add(postdetail(
            id: element["id"],
            displayName: displayName,
            image: element["image"],
            title: element["title"],
            postId: element["postId"],
            price: element["price"].toString(),
            sellerDonate: element["sellerDonate"],
            sellerId: element["sellerId"]));
      }
      postcard = temp;
      /* print(res.data.toString()); */
      notifyListeners();
    } catch (err) {
      print(err);
    }
    return postcard;
  }
  Future<String> getDisplayName(String id) async {
    var endpoint = publicAPI + 'user?id=$id';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data['displayName'].toString();
      /* print(endpoint); */
      if (data == null) return " ";

      return data;
    } catch (err) {
      print(err);
    }
  }
}
