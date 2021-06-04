import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Homefeed())],
        child: MaterialApp(
          title: 'Bottom navigation bar',
          home: BotNav(),
        ));
  }
}
