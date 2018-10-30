// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter/material.dart';
// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'menu.dart';
import 'gloals.dart' as globals;
//import 'package:firebase_messaging/firebase_messaging.dart';
/*void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Menu'),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static String tag ='my-page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

/*
  FirebaseMessaging _firebase=new FirebaseMessaging();

  void initState() {
    super.initState();
    _firebase.configure(
      onMessage: (Map<String, dynamic> message){
        print(message);
      },
      onResume: (Map<String, dynamic> message){
        print(message);
      },
      onLaunch: (Map<String, dynamic> message){
        print(message);
      },
    );
    _firebase.getToken().then((token){
      print(token);
    });
  }
*/
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('My Page'),
      ),
      drawer:MenuPage(),
      /* new Drawer(
          child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountEmail: new Text("유저 이메일 가져와서 넣기"),
                  accountName: new Text("유저 ID 가져오기"),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text("fe"),
                  ),
                  
                ),
                new ListTile(
                  title: new Text("Main Page"),
                ),
                new Divider(height:5.0),
                new ListTile(
                  title: new Text("Main Page2"),
                ),
              ]
          )
      ),*/

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Expanded(
                flex:1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                     /* Text(
                          'My Page',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            fontSize: 45.0,
                          )
                      ),*/

                    ]
                )
            ),
            new Expanded(
              flex:3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/happiness.jpg'),
                    radius: 70.0,
                  ),
                  new Expanded(
                      child: Row(
                          children: [
                            new Expanded(
                              flex:1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(
                                    "ID : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 19.0,
                                    ),
                                  ),
                                /*  Text(
                                    "PW : ",
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 19.0,
                                    ),
                                  ),*/
                                  Text(
                                    "E-Mail : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 19.0,
                                    ),
                                  ),

                                ],
                              ),

                            ),
                            new Expanded(
                              flex:2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(globals.userName,
                                    //"로그인 ID 값: ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  /*Text(
                                    "로그인 PW 값 : ",
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),*/
                                  Text(
                                    globals.userEmail,
                                    //"로그인 E-Mail 값 : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  //Text(" "),
                                 // Text(" "),
                                  //Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  /*new Expanded(

                                    child: new RaisedButton(
                                      padding: EdgeInsets.all(5.0),
                                      child: new Text('회원정보 수정', style: TextStyle(
                                        fontSize: 16.5,
                                      ),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      elevation: 4.0,
                                      splashColor: Colors.blueGrey,
                                      onPressed: () {
                                        // Perform some action
                                      },
                                    ),
                                  ),*/
                                ],
                              ), 

                            )
                          ]
                      )
                  )
                ],
              ),
            ),
            new Expanded(
                flex:5,

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Posts",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          fontSize: 25.0,
                        ),
                      ),
                      //list view로 포스트 출력
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}

