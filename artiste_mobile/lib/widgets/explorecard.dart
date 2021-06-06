import 'package:flutter/material.dart';

class ExploreCard extends StatefulWidget {
  final String id, title, image, sellerId, displayName;
  final int price;
  final bool sellerDonate, isAvailable;

  ExploreCard({
    this.displayName,
    this.id,
    this.title,
    this.image,
    this.sellerId,
    this.price,
    this.isAvailable,
    this.sellerDonate,
  });
  @override
  _ExploreCardState createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Wrap(
        direction: Axis.horizontal,
        spacing: 1.0,
        runSpacing: 1.0,
        children: List.generate(1, (index) {
          return Container(
            width: (size.width - 3) / 3,
            height: (size.width - 3) / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          );
        }));
  }
}
// decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(widget.image), fit: BoxFit.cover)),
