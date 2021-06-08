import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artiste_mobile/widgets/InputEmail.dart';
import 'package:artiste_mobile/widgets/InputPassword.dart';
import 'package:artiste_mobile/screen/register.dart';
import 'package:artiste_mobile/screen/home.dart';
import 'package:artiste_mobile/provider/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    String statusText = '';

  void setStatus(int status) {
    setState(() {
      statusText =
          status == 1 ? 'Log In Success.' : 'Email or Password is incorrect.';
    });
  }
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    
    Size size = MediaQuery.of(context).size;
    // We are using this to determine Keyboard is opened or not
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: <Widget>[
        //Login Form
        Container(
            margin: EdgeInsets.all(24),
            alignment: Alignment.center,
            // child: SingleChildScrollView(
            child: Form(
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Artiste',
                        style: GoogleFonts.calligraffitti(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 76,
                              color: kTextColor),
                        ),
                      ),
                      SizedBox(height: 15),
                      RoundedInput(
                        icon: Icons.mail,
                        controller: _emailController,
                        hint: 'E-mail Address',
                      ),
                      RoundedPasswordInput(
                          controller: _passwordController, hint: 'Password'),
                      SizedBox(height: 5),
                      SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                      color: kPrimaryColor,
                      child: Text("Login",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                      onPressed: () async {
                            await auth
                                .login(
                                    _emailController.text.toString(),
                                    _passwordController.text.toString(),)
                                .then((status) {
                                  print(status);
                                  if (status == true) {
                                    Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                                        setStatus(1);
                                  } else {
                                  setStatus(0);
                                  }
                                });

                      }
                      )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Don't have an account ? ",
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontSize: 15, color: kPrimaryColor),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return registerScreen();
                              }));
                            },
                            child: Text(
                              "Sign up.",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                fontSize: 17.5,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                              )),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            )),
        // ),
      ]),
    ));
  }
}
