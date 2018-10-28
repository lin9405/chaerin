import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget{

final String pageText;
OtherPage(this.pageText);


  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text(pageText),),
        backgroundColor: Colors.red[200],
        body: Center(
          child: new Text(pageText),
        ),
      );
    }
}