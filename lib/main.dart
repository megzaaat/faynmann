import 'package:flutter/material.dart';
import 'package:faynmann/ui/login.dart';
import 'package:faynmann/ui/mainpage.dart';
import 'package:faynmann/ui/filter.dart';

void main (){
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Cairo'),
    home: Login(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder> {
      '/Login': (BuildContext context) => Login(),
      '/MainPage': (BuildContext context) => MainPage(),
      '/Filter': (BuildContext context) => Filter(),
    },
  )
  );
}
