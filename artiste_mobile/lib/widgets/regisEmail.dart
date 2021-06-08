import 'package:artiste_mobile/widgets/Inputcontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:artiste_mobile/provider/auth.dart';

class regisEmail extends StatefulWidget {
  final TextEditingController emailController;
  regisEmail({
    this.emailController,
  });
  @override
  _regisEmailState createState() => _regisEmailState();
}

class _regisEmailState extends State<regisEmail> {
  @override

  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: kPrimaryColor)),
            validator: (String value) {
              if (value == null || value.isEmpty 
                || !RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                  .hasMatch(value)) {
              } else
                return null;
            },
            controller: widget.emailController,
            ));
  }
}
