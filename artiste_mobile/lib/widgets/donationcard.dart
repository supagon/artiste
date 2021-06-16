import 'package:artiste_mobile/screen/postInfo.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:google_fonts/google_fonts.dart';

class Donationcard extends StatefulWidget {
  bool isPressed;
  final String title, image, price, sellerId, displayName, postId;
  final String id, buyerId;
  final bool buyerDonate, sellerDonate, isAvailable;
  Donationcard(
      {this.displayName,
      this.postId,
      this.id,
      this.title,
      this.image,
      this.price,
      this.sellerDonate,
      this.sellerId,
      this.isAvailable,
      this.buyerDonate,
      this.buyerId,
      this.isPressed});

  @override
  _DonationcardState createState() => _DonationcardState();
}

class _DonationcardState extends State<Donationcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          SizedBox(height: 5),
          Text("    "+ widget.title.toString(),
          style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kPrimaryColor),),),
          SizedBox(height: 5),
          Text("       Price: " + widget.price.toString(),
          style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: kPrimaryColor),),),
        ],
      ),
    );
  }
}