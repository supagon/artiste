import 'package:artiste_mobile/provider/auth.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/screen/rank.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:artiste_mobile/widgets/postbar.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:artiste_mobile/provider/getPostInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:artiste_mobile/widgets/PostcardBody.dart';
import 'package:dio/dio.dart';

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

  bool buyerDonation = false;
  void donationhandle(bool value) {
    print(value);
    setState(() {
      buyerDonation = value;
    });
  }

  void purchase() async {
   /*  print(Provider.of<Auth>(context, listen: false).id);
    print(widget.id);
    print(buyerDonation); */

    try {
      print(Provider.of<Auth>(context, listen: false).id);
      print(widget.id);
      print(buyerDonation);
      final res =
          await Dio().post(('http://23.102.228.97:3000/purchase'), data: {
        'buyerId': Provider.of<Auth>(context, listen: false).id,
        'postId': widget.id,
        'buyerDonate': buyerDonation,
      });

      if (res.statusCode == 200) {
        print("success");
      } else if (res.statusCode == 400) {
        print('Something went wrong. Please Try Again');
      }
    } catch (err) {
      print(err);
    }
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
                margin: EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: this.buyerDonation,
                          onChanged: (bool value) {
                            donationhandle(value);
                          },
                        ),
                        Text("Do you want to donate?"),
                      ],
                    ),
                    RaisedButton(
                      color: kPrimaryColor,
                      child: Text(
                        "Purchase",
                        style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Checkout confirmation'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                this.purchase();
                                Navigator.pop(context, 'Cancel');
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Checkout Success'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ),
                                        ),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNav(
        selectedIndex: 0,
      ),
    );
  }
}
// print(Provider.of<Auth>(context, listen: false).id);
