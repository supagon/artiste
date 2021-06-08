import 'package:flutter/material.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

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

      child: child,
    );
  }
}