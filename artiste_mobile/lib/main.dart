import 'package:artiste_mobile/provider/auth.dart';
import 'package:artiste_mobile/provider/getPostInfo.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/provider/users.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/screen/login.dart';
import 'package:artiste_mobile/screen/register.dart';
import 'package:artiste_mobile/screen/user.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Homefeed()),
          ChangeNotifierProvider(create: (context) => Auth()),
          ChangeNotifierProvider(create: (context) => Users()),
          ChangeNotifierProvider(create: (context) => Getpostinfo())
        ],
        child: MaterialApp(
          title: 'Bottom navigation bar',
          home: LoginScreen(),
        ));
  }
}
