import 'package:flutter/material.dart';
import 'login_page.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{

Widget build(BuildContext context){
    return MaterialApp(
      title: 'kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        fontFamily: 'Nunito',
      ),
      home: LoginPage()
     );
  }
}