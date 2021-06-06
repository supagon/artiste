import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/provider/homelist.dart';
import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:artiste_mobile/widgets/explorecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  void Getlist() async {
    try {
      await Provider.of<Homefeed>(context, listen: false).fetchHomefeed();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    Getlist();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: Appbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Consumer<Homefeed>(
            builder: (context, value, child) {
              final explorelist = value.feed;
              print(explorelist.length);
              return GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                physics: NeverScrollableScrollPhysics(),
                itemCount: explorelist.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ExploreCard(
                    image: explorelist[index].image,
                  );
                },
              );
            },
          ),
        ),
      ),
    ));
  }
}
// return ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: value.feed.length,
//               itemBuilder: (context, index) {
//                 return ExploreCard(
//                   image: explorelist[index].image,
//                 );
//               },
//             );
