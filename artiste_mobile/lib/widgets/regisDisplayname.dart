import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
class regisDisplayname extends StatefulWidget {
      final TextEditingController displaynameController;
      regisDisplayname({
    this.displaynameController,
  });
  @override
  _regisDisplaynameState createState() => _regisDisplaynameState();
}

class _regisDisplaynameState extends State<regisDisplayname> {
  @override
  final _displaynameController = TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*0.9,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kInput
      ),
      child: TextFormField(
          decoration: InputDecoration(
             hintText: 'Displayname',
            border: InputBorder.none
            ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Displayname is Required';
            } else
              return null;
          },
            controller: widget.displaynameController,
          ),
    );
  }
}