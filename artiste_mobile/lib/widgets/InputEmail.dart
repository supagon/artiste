import 'package:flutter/material.dart';
import 'package:artiste_mobile/widgets/Inputcontainer.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:provider/provider.dart';

class RoundedInput extends StatefulWidget {
   RoundedInput({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.controller,
  }) : super(key: key);

  IconData icon;
  String hint;
  bool isError = false;
  final TextEditingController controller;

  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          controller: widget.controller ,
         validator: (value) {
            if (value == null || value.isEmpty 
            || RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+").hasMatch(value)){
              setState(() {
                widget.isError = true;
                widget.hint = "Enter a valid email";
              });
            }
            return null;
          },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.isError? Colors.red: Colors.black54),
          border: InputBorder.none
        ),
      ),);
  }
}
