import 'dart:ffi';

import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/provider/users.dart';
import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:artiste_mobile/widgets/userfeed.dart';
import 'package:artiste_mobile/widgets/userfeedBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  void GetFeed() async {
    try {
      await Provider.of<Users>(context, listen: false).getUserImages();
      await Provider.of<Users>(context, listen: false).getDisplayNameInfo();
      await Provider.of<Users>(context, listen: false).getInfo();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    GetFeed();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: UserFeed(),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Consumer<Users>(
                builder: (context, value, child) {
                  final images = value.images;
                  return UserFeedBody(
                    images: images,
                    displayname: value.displayname,
                    firstname: value.info.firstname,
                    lastname: value.info.lastname,
                    donation: value.info.donation.toString(),
                  );
                },
              ),
            ],
          ),
        )),
        bottomNavigationBar: BotNav(
          selectedIndex: 4,
        ),
      ),
    );
  }
}
