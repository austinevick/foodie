import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  String error = '';

  bool obscureText = true;
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  //6iAD2m
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  /*  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  focusedBorder: OutlineInputBorder()),
                            ),
                          ),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) => email = value,
                      validator: (value) => !value.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) => password = value,
                      validator: (value) => value.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                      obscureText: obscureText,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: obscureText
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                toggle();
                              }),
                          labelText: 'Password',
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              final result = await _authService
                                  .registrationWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid email';
                                });
                              }
                             //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            }
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'or sign up with',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'image/google.webp',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'image/facebook.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  Text(
                    error,
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account?',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blue)),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.blue)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
