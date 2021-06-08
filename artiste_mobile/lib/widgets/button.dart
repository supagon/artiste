import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:provider/provider.dart';
class RoundedButton extends StatelessWidget {
  
  const RoundedButton({
    Key key,
    @required this.title,
    this.pagelink,
    this.emailController,
    this.passwordController,
  }) : super(key: key);

  final String title;
  final Widget pagelink;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          auth
                .login(emailController.text.toString(),
                    passwordController.text.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) => this.pagelink));
/*         if (formkey.currentState.validate()){
            try { FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
              await _firebaseAuth.signInWithEmailAndPassword(
                email: email.text, 
                password: password.text
                );
                 Navigator.push(context, MaterialPageRoute(builder: (context) => this.pagelink));
            } on FirebaseAuthException catch (e){
              ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('There was an error')));
            }
          }else{
            print("hello12");
            ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('There was an error')));
          } */
        },
        color: kPrimaryColor,
          child: Text(
            this.title,
            style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        ),
    );
  }
}