import 'package:artiste_mobile/screen/postInfo.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:artiste_mobile/provider/homefeed.dart';
import 'package:google_fonts/google_fonts.dart';

class PostcardBody extends StatefulWidget {
  bool isPressed;
  final String title, image, price, sellerId, displayName, postId;
  final String id;
  final bool sellerDonate, isAvailable;
  PostcardBody(
      {this.displayName,
      this.postId,
      this.id,
      this.title,
      this.image,
      this.price,
      this.sellerDonate,
      this.sellerId,
      this.isAvailable,
      this.isPressed});

  @override
  _PostcardBodyState createState() => _PostcardBodyState();
}

class _PostcardBodyState extends State<PostcardBody> {
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
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://cdn.discordapp.com/emojis/686217508465672268.png?v=1")),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      widget.displayName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                new IconButton(
                  icon: new Icon(widget.isPressed
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: widget.isPressed ? Colors.red : Colors.black,
                  onPressed: () {
                    setState(() {
                      widget.isPressed = !widget.isPressed;
                    });
                  },
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: new Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(top: 10,left: 15, right: 15),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(widget.title.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kPrimaryColor),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Price: " + widget.price.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
