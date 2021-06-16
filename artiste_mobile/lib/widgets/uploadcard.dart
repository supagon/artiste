import 'package:artiste_mobile/provider/uploadpost.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/screen/upload.dart';
import 'package:artiste_mobile/widgets/Inputcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadCard extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController imageurlController;
  final String sellerId;

  bool ischeck = false;
  UploadCard(
      {this.titleController,
      this.priceController,
      this.imageurlController,
      this.sellerId});

  @override
  UploadCardState createState() => UploadCardState();
}

class UploadCardState extends State<UploadCard> {
  @override
  Widget build(BuildContext context) {
    void Upload() async {
      try {
        await Provider.of<UploadPost>(context, listen: false).postNewPost(
          widget.titleController.text,
          widget.imageurlController.text,
          widget.priceController.text,
          widget.ischeck,
        );
      } catch (err) {
        print(err);
      }
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: new Image(
              image: new NetworkImage(widget.imageurlController.text != ""
                  ? widget.imageurlController.text
                  : "https://img.freepik.com/free-vector/concept-image-upload-landing-page_23-2148319404.jpg?size=626&ext=jpg"),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          new InputContainer(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
            controller: widget.titleController,
          )),
          SizedBox(
            width: 10,
          ),
          new InputContainer(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Price',
              border: InputBorder.none,
            ),
            controller: widget.priceController,
          )),
          SizedBox(
            width: 10,
          ),
          new InputContainer(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: 'ImageURL',
              border: InputBorder.none,
            ),
            controller: widget.imageurlController,
            onChanged: (value) => setState(() {
              widget.imageurlController.text = value;
            }),
          )),
          SizedBox(
            width: 10,
          ),
          new CheckboxListTile(
            title: const Text('Donate'),
            value: timeDilation != 1.0,
            onChanged: (bool value) {
              setState(() {
                timeDilation = value ? 1.5 : 1.0;
                widget.ischeck = !widget.ischeck;
                print(widget.ischeck);
              });
            },
          ),
          new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF544667),
              onPrimary: Colors.white,
            ),
            onPressed: () async {
              await Upload();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            },
            child: Text(
              'Create',
              style: GoogleFonts.montserrat().copyWith(
                  fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }
}
