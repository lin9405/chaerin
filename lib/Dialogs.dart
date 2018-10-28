import 'package:flutter/material.dart';
import 'gloals.dart' as globals;
//import 'posting.dart';

class Dialogs{
  information(BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
        child: ListBody(
        children: <Widget>[
        Text(description)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
             onPressed: () {
                if(globals.posting==1){
                  // Navigator.push(
                  // context,
                  //   MaterialPageRoute(builder: (context) => Posting()));
                  //   globals.posting=0;
                }
                else{
                Navigator.pop(context);
              }},
              child: Text('Ok'),
            )
          ],
          );
      }
    );
  }
}