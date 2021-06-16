import 'package:artiste_mobile/provider/uploadpost.dart';
import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:artiste_mobile/widgets/uploadcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageurlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Upload();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Consumer<UploadPost>(
              builder: (context, value, child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return UploadCard(
                      titleController: _titleController,
                      priceController: _priceController,
                      imageurlController: _imageurlController,
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BotNav(
          selectedIndex: 2,
        ),
      ),
    );
  }
}
