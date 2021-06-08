import 'package:flutter/material.dart';
import 'package:artiste_mobile/widgets/Inputcontainer.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:provider/provider.dart';

class RoundedPasswordInput extends StatefulWidget {
  RoundedPasswordInput({
    Key key,
    @required this.hint,
    @required this.controller,
  }) : super(key: key);

  String hint;
  bool isError = false;
  final TextEditingController controller;
  @override
  _RoundedPasswordInputState createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty){
              setState(() {
                widget.isError = true;
                widget.hint = "Enter your password";
              });
            }
            return null;
          },
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.isError? Colors.red: Colors.black54),
          border: InputBorder.none
        ),
      ),);
  }
}
