import 'package:artiste_mobile/provider/DonationList.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:artiste_mobile/provider/getPostInfo.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/provider/uploadpost.dart';
import 'package:artiste_mobile/provider/users.dart';
import 'package:artiste_mobile/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          ChangeNotifierProxyProvider<Auth, UploadPost>(
              create: (context) => UploadPost(""),
              update: (context, auth, prev) => UploadPost(auth.id)),
          ChangeNotifierProvider(create: (context) => Getpostinfo()),
          ChangeNotifierProvider(create: (context) => DonationList())
        ],
        child: MaterialApp(
          title: 'Bottom navigation bar',
          home: LoginScreen(),
        ));
  }
}
