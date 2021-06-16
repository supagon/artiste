import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './homelist.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'Donator.dart';

class DonationList extends ChangeNotifier {
  List<Donator> _donationList = [];

  var publicAPI = 'http://23.102.228.97:3000/';

  List<Donator> get donationList {
    return [..._donationList];
  }

  Future<List<Donator>> fetchDonationList() async {
    var endpoint = publicAPI + 'user/donation';

    try {
      final res = await Dio().get(endpoint);
      final data = res.data.toList();

      /*  print(data.length); */
      if (data == null) return [];

      List<Donator> fetchedHomefeed = [];

      for (int i = 0; i < data.length; i++) {
        final value = data[i];

        /* print(temp); */
        fetchedHomefeed.add(Donator(
          id: value['id'],
          displayName: value['displayName'],
          donation: value['donation'],
        ));
      }
      _donationList = fetchedHomefeed;
      /* print(fetchedHomefeed.length);  */

      notifyListeners();
    } catch (err) {
      print(err);
      return throw (err);
    }
    return _donationList;
  }
}
