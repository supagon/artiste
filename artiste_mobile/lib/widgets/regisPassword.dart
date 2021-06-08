import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';


class regisPassword extends StatefulWidget {
      final TextEditingController passwordController;
      regisPassword({
    this.passwordController,
  });
  @override
  _regisPasswordState createState() => _regisPasswordState();
}

class _regisPasswordState extends State<regisPassword> {
  @override
  final _passwordController = TextEditingController();
    
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
            hintText: 'Password',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock,
            color: kPrimaryColor
            )
            ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please enter a Password';
            } else
              return null;
          },
            controller: widget.passwordController,
            ),
    );
  }
}