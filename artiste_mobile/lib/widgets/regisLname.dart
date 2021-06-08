import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';

class regisLname extends StatefulWidget {
      final TextEditingController lastnameController;
      regisLname({
    this.lastnameController,
  });
  @override
  _regisLnameState createState() => _regisLnameState();
}

class _regisLnameState extends State<regisLname> {
  @override
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
          hintText: 'Lastname',
          border: InputBorder.none
          ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Lastname is Required';
          } else
            return null;
        },
            controller: widget.lastnameController,
            ));
  }
}