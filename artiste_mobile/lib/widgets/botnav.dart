import 'package:artiste_mobile/screen/explore.dart';
import 'package:artiste_mobile/screen/rank.dart';
import 'package:artiste_mobile/screen/user.dart';
import 'package:flutter/material.dart';
import '../screen/home.dart';

class BotNav extends StatefulWidget {
  BotNav({this.selectedIndex});
  final selectedIndex;
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  //int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   Home(),
  //   Explore(),
  //   Text('add'),
  //   Text('donate rank'),
  //   Text('profile'),
  // ];

  // void _onItemTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  Widget onPageChange(int index) {
    if (index == 0) {
      return Home();
    } else if (index == 1) {
      return Explore();
    } else if (index == 4) {
      return User();
    }
  }

  List<Widget> pageRoutes = [
    Home(),
    Explore(),
    User(),
    Rank(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: BottomNavigationBar(
        unselectedItemColor: Colors.white54,
        selectedItemColor: Color(0xFFCE7672),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF544667),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            label: 'Rank',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: (index) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return pageRoutes[index];
        })),
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
