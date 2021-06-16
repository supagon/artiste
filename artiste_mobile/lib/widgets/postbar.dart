import 'package:artiste_mobile/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:artiste_mobile/provider/getPostInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Postbar extends StatefulWidget implements PreferredSizeWidget {
  final String displayName;
  Postbar({
    this.displayName
  });
 Size get preferredSize => const Size.fromHeight(55);


  @override
  _PostbarState createState() => _PostbarState();
}

class _PostbarState extends State<Postbar> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:AppBar(
    backgroundColor: Color(0xFF544667),
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios_outlined),
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
  ), 
  title: Text("Sample"),
  centerTitle: true,
    ),
    );
  }
}
/* caffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
 */