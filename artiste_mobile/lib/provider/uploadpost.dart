import 'dart:io';

import 'package:artiste_mobile/provider/homelist.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UploadPost extends ChangeNotifier {
  List<Homelist> _newpost = [];
  // File image;
  String _image;
  String _title;
  String _id;
  String _price;
  bool _sellerDonate;
  String _sellerId;
  var publicAPI = 'http://23.102.228.97:3000/';

  UploadPost(this._id);

  List<Homelist> get newpost {
    return _newpost;
  }

  String get id {
    return _id;
  }

  String get image {
    return _image;
  }

  String get title {
    return _title;
  }

  String get price {
    return _price;
  }

  String get sellerId {
    return _sellerId;
  }

  bool get sellerDonate {
    return _sellerDonate;
  }

  Future<void> postNewPost(
      String title, String image, String price, bool sellerDonate) async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('user')) return false;
    final user = json.decode(prefs.getString('user'));
    _id = user['id'];
    notifyListeners();
    var endpoint = publicAPI + 'post';
    print(_id);
    try {
      final res = await Dio().post((endpoint), data: {
        'title': title,
        'image': image,
        'price': price,
        'sellerDonate': sellerDonate,
        'sellerId': _id,
      });
      final data = res.data;
      if (data == null) return [];

      if (res.statusCode == 201) {
        _id = data['id'];
      } else if (res.statusCode == 400) {
        print('Something wrong.');
      }
    } catch (err) {
      return throw (err);
    }
  }

  // Future<void> postImage() async {
  //   File image;
  //   var endpoint = publicAPI + 'post';
  //   var imagePicker = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   if (imagePicker != null) {
  //     setState(() {
  //       image = imagePicker;
  //     });
  //   }
  //   try {} catch (err) {
  //     print(err);
  //   }
  // }
}
