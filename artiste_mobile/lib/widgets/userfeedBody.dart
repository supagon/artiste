import 'package:artiste_mobile/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserFeedBody extends StatefulWidget {
  final List<String> images;
  final String displayname;
  final String firstname, lastname;
  final String donation;

  UserFeedBody({
    this.images,
    this.displayname,
    this.firstname,
    this.lastname,
    this.donation,
  });

  @override
  _UserFeedBodyState createState() => _UserFeedBodyState();
}

class _UserFeedBodyState extends State<UserFeedBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: (size.width - 20) * 0.3,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.grey),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/media/E0CwxKJVUAEQh_n?format=jpg&name=large"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (size.width - 20) * 0.7,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          "Firstname: " + widget.firstname,
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Lastname: " + widget.lastname,
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Donate: " + widget.donation,
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
      Container(
        height: 35,
        width: (size.width - 20),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFCE7672),
        ),
        child: Center(
          child: Text(
            "Edit Profile",
            style: GoogleFonts.montserrat().copyWith(
                fontWeight: FontWeight.normal, color: Color(0xFFF5F5F5)),
          ),
        ),
      ),
      SizedBox(height: 10),
      GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1),
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.images.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              direction: Axis.horizontal,
              spacing: 1.0,
              runSpacing: 1.0,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: (size.width - 3) / 3,
                    height: (size.width - 3) / 3,
                    child: Image(
                      image: NetworkImage(widget.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],

              // List.generate(
              //   1,
              //   (index) {
              //     return Container(
              //       width: (size.width - 3) / 3,
              //       height: (size.width - 3) / 3,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: NetworkImage(widget.images[index]),
              //               fit: BoxFit.cover)),
              //     );
              //   },
              // )
            );
          })
    ]));
  }
}

// return Container(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: (size.width - 28) * 8.3,
//                       child: Stack(
//                         children: [
//                           Container(
//                             height: 100,
//                             width: 100,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border:
//                                     Border.all(width: 1, color: Colors.grey),
//                                 image: DecorationImage(
//                                     image: NetworkImage(
//                                         "https://cdn.discordapp.com/emojis/686217508465672268.png?v=1"),
//                                     fit: BoxFit.cover)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: (size.width - 20) * 0.7,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "23 Savage",
//                                 style: GoogleFonts.montserrat().copyWith(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "Donation 666",
//                                 style: GoogleFonts.montserrat().copyWith(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     height: 1.5),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Wrap(
//             direction: Axis.horizontal,
//             spacing: 1.0,
//             runSpacing: 1.0,
//             children: List.generate(1, (index) {
//               return Container(
//                 width: (size.width - 3) / 3,
//                 height: (size.width - 3) / 3,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(widget.image), fit: BoxFit.cover)),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
