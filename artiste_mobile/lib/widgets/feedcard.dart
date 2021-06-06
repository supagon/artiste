import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  bool isPressed;
  final String id, title, image, sellerId, displayName;
  final int price;
  final bool sellerDonate, isAvailable;

  FeedCard(
      {this.displayName,
      this.id,
      this.title,
      this.image,
      this.sellerId,
      this.price,
      this.isAvailable,
      this.sellerDonate,
      this.isPressed});

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
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
        ],
      ),
    );
  }
}
