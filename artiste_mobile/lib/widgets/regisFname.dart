import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';


class regisFname extends StatefulWidget {
    final TextEditingController firstnameController;
      regisFname({
    this.firstnameController,
  });
  @override
  _regisFnameState createState() => _regisFnameState();
}

class _regisFnameState extends State<regisFname> {
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
             hintText: 'Firstname',
            border: InputBorder.none
            ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Firstname is Required';
            } else
              return null;
          },
            controller: widget.firstnameController,
            ),
    );
  } 
}