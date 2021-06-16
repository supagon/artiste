import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(55);

  Appbar({Key key, this.page}) : super(key: key);

  final page;
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF544667),
      // shadowColor: ,
      textTheme: TextTheme(headline6: TextStyle(color: Color(0xFFF5F5F5))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(17))),
      title: Text(
        "Artiste",
        style: GoogleFonts.montserrat().copyWith(
            fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 0),
      ),
      elevation: 8,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              // onTap: () {
              //   user.logout().then((_) => Navigator.pushReplacementNamed(
              //       context, LoginPage.routeName));
              // },
              child: Icon(Icons.add),
            )),
        Icon(Icons.menu)
      ],
      actionsIconTheme:
          IconThemeData(size: 30.0, color: Color(0xFFF5F5F5), opacity: 10.0),
    );
  }
}
