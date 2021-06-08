import 'package:artiste_mobile/widgets/regisFname.dart';
import 'package:artiste_mobile/widgets/regisLname.dart';
import 'package:artiste_mobile/widgets/regisDisplayname.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artiste_mobile/screen/login.dart';
import 'package:flutter/src/material/raised_button.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:artiste_mobile/widgets/regisEmail.dart';
import 'package:artiste_mobile/widgets/regisPassword.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class registerScreen extends StatefulWidget {
  registerScreen({Key key}) : super(key: key);

  static const routeName = '/register';
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _displaynameController = TextEditingController();

  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
      margin: EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Create Account',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 28,
                        color: kPrimaryColor),
                  ),
                ),
                SizedBox(height: 15),
                regisEmail(emailController: _emailController,),
                SizedBox(height: 10),
                regisPassword(passwordController: _passwordController,),
                SizedBox(height: 10),
                regisFname(firstnameController: _firstNameController,),
                SizedBox(height: 10),
                regisLname(lastnameController: _lastNameController,),
                SizedBox(height: 10),
                regisDisplayname(displaynameController: _displaynameController,),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                      color: kPrimaryColor,
                      child: Text("Create Account",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                      onPressed: () async {
                            await auth
                                .signup(
                                    _firstNameController.text.toString(),
                                    _lastNameController.text.toString(),
                                    _emailController.text.toString(),
                                    _passwordController.text.toString(),
                                    _displaynameController.text.toString())
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen())));
                      }
                      ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Have an account ? ",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 15, 
                            color: kPrimaryColor
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text(
                          "Sign In.",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 17.5,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      )
                    ],
                  ),
              ])),
    )));
  }
}
