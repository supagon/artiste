import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/provider/homelist.dart';
import 'package:artiste_mobile/screen/cart.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/widgets/feedcard.dart';
import 'package:artiste_mobile/widgets/postbar.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:artiste_mobile/provider/getPostInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:artiste_mobile/widgets/PostcardBody.dart';

class postInfo extends StatefulWidget {
  bool isPressed;
  final String id;
  postInfo({this.id, this.isPressed});
  static const routeName = '/post';

  @override
  _postInfoState createState() => _postInfoState();
}

class _postInfoState extends State<postInfo> {
  void GetPost() async {
    try {
      await Provider.of<Getpostinfo>(context, listen: false)
          .getpostinfo(widget.id);
      await Provider.of<Homefeed>(context, listen: false).fetchHomefeed();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Postbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<Getpostinfo>(builder: (context, value, child) {
                final postcard = value.postcard;
                print(postcard.length);
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: postcard.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return PostcardBody(
                      id: postcard[index].id,
                      displayName: postcard[index].displayName,
                      title: postcard[index].title,
                      image: postcard[index].image,
                      price: postcard[index].price,
                      sellerDonate: postcard[index].sellerDonate,
                      sellerId: postcard[index].sellerId,
                      isPressed: false,
                    );
                  },
                );
              }),
              Container(
                  child: RaisedButton(
                      color: kPrimaryColor,
                      child: Text("Purchase",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cart()));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
