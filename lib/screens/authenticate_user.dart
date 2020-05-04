import 'package:flutter/material.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class AuthenticateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
  if (user == null) {
    return SignupScreen();
    }
    return HomePage();
      
    
  }
}