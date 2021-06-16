import 'package:artiste_mobile/provider/users.dart';
import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserFeed extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(55);
  final String displayname;

  UserFeed({
    this.displayname,
  });

  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  void GetUsername() async {
    try {
      await Provider.of<Users>(context, listen: false).getDisplayNameInfo();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    GetUsername();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Consumer<Users>(builder: (context, value, child) {
          print(value.displayname);
          final name = value.displayname;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.montserrat()
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      splashRadius: 15,
                      icon: Icon(Icons.login_outlined),
                      onPressed: () {})
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

// Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10 ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             width: (size.width - 28) * 8.3,
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: 100,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(width: 1, color: Colors.grey),
//                                     image: DecorationImage(
//                                       image: NetworkImage("https://cdn.discordapp.com/emojis/686217508465672268.png?v=1"),
//                                       fit: BoxFit.cover
//                                     )
//                                   ),
//                                 ),

//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: (size.width - 20) * 0.7,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "23 Savage",
//                                       style: GoogleFonts.montserrat()
//                                       .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       "Donation 666",
//                                       style: GoogleFonts.montserrat()
//                                       .copyWith(fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),

//                     ],
//                   ),

//                 ),
