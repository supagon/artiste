import 'package:flutter/material.dart';
import '../screen/home.dart';

class BotNav extends StatefulWidget {
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('Messgaes Screen'),
    Text('Seacrh Screen'),
    Text('add'),
    Text('cart screen'),
    Text('Profile screen'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.shopping_cart,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
