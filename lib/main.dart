import 'package:flutter/material.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value: AuthService().user,
          child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
