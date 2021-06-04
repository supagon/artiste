import 'package:artiste_mobile/provider/homelist.dart';
import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:artiste_mobile/widgets/feedcard.dart';
import 'package:flutter/material.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPressed = false;

  void GetFeed() async {
    try {
      await Provider.of<Homefeed>(context, listen: false).fetchHomefeed();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetFeed();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(),
        body: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Consumer<Homefeed>(
                    builder: (context, value, child) {
                      final homelist = value.feed;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homelist.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return FeedCard(
                            image: homelist[index].image,
                            isPressed: false,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) => index == 0
//           ? new SizedBox(
//               child: new Appbar(),
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
//                   child: Row(
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           new Container(
//                             height: 40.0,
//                             width: 40.0,
//                             decoration: new BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: new DecorationImage(
//                                   fit: BoxFit.fill,
//                                   image: new NetworkImage(
//                                       "https://cdn.discordapp.com/emojis/686217508465672268.png?v=1")),
//                             ),
//                           ),
//                           new SizedBox(
//                             width: 10.0,
//                           ),
//                           new Text(
//                             "BestK",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       new IconButton(
//                         icon: Icon(Icons.more_vert),
//                         onPressed: null,
//                       )
//                     ],
//                   ),
//                 ),
//                 Flexible(
//                   fit: FlexFit.loose,
//                   child: new Image.network(
//                     "https://preview.redd.it/menmtu1v9xl61.jpg?width=960&crop=smart&auto=webp&s=d7f92d81e4fd18c8bc99317664872ae759453120",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       new Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           new IconButton(
//                             icon: new Icon(isPressed
//                                 ? Icons.favorite
//                                 : Icons.favorite_border),
//                             color: isPressed ? Colors.red : Colors.black,
//                             onPressed: () {
//                               setState(() {
//                                 isPressed = !isPressed;
//                               });
//                             },
//                           ),
//                           new SizedBox(
//                             width: 16.0,
//                           ),
//                           new Icon(Icons.add_comment_outlined),
//                           new SizedBox(
//                             width: 16.0,
//                           ),
//                           new Icon(Icons.send_sharp),
//                         ],
//                       ),
//                       new Icon(Icons.bookmark_border_rounded)
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     "Liked by pawankumar, pk and 528,331 others",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       new Container(
//                         height: 40.0,
//                         width: 40.0,
//                         decoration: new BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: new DecorationImage(
//                               fit: BoxFit.fill,
//                               image: new NetworkImage(
//                                   "https://cdn.discordapp.com/emojis/686217508465672268.png?v=1")),
//                         ),
//                       ),
//                       new SizedBox(
//                         width: 10.0,
//                       ),
//                       Expanded(
//                         child: new TextField(
//                           decoration: new InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Add a comment...",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child:
//                       Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
//                 )
//               ],
//             ),
//     );
