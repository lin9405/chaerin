/*
import 'package:flutter/material.dart';

//import './mainPage.dart';
import './Dialogs.dart';
import 'menu.dart';
import 'gloals.dart' as globals;



void main() => runApp(MaterialApp(home: MyApp2()));

class MyApp2 extends StatelessWidget {
  
  //MenuPage menuPage = new MenuPage();
  Dialogs dialogs = new Dialogs();
  
 @override
 Widget build(BuildContext context) {
  
 
   var card = new Card(
     child: new Column(
       children: <Widget>[
         new ListTile(
           leading: new Icon(Icons.stars, color: Colors.red, size: 40.0,),
           title: new Text("what to do",style: new TextStyle(fontWeight: FontWeight.w700)),
           subtitle: new Text("explain the working"),
         ),
      //   new Divider(color: Colors.red, indent: 1.0,)
      ],
    ),
   );


   final sizedBox = new Container(
     margin: new EdgeInsets.only(left: 10.0, right: 10.0),
     child: new SizedBox(
       height : 220.0,
       child: card,

     ),
   );

  

  Widget buildButton(IconData icon, String buttonTitle){
    final Color tintColor = Colors.red;

    return new Column(
      children: <Widget>[
        new Icon(icon, color: tintColor),
        new FlatButton(
         // margin: const EdgeInsets.only(top: 10.0),
          child: new Text(buttonTitle, style: new TextStyle(fontSize: 16.0,
          fontWeight: FontWeight.w600, color: tintColor),
          ),
          onPressed: (){},
        )
      ],
    );

  }


  Widget fourButtonsSection = new Container(
    child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: <Widget>[
       
      new Icon(Icons.save_alt, color: Colors.red,),
      new FlatButton(
        child: new Text('Posting', style: new TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        onPressed: (){
          globals.posting=1;
          dialogs.information(context, 'Do you want to post?', 'push the ok button');
        },
      ),
      new Icon(Icons.favorite, color: Colors.red,),
      new FlatButton(
        child: new Text('Delivery', style: new TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        onPressed: (){
          dialogs.information(context, 'Do you want to pass it on to someone else?', 'push the ok button');
        },
      ),
      new Icon(Icons.person_add, color: Colors.red,),
      new FlatButton(
        child: new Text('Invite', style: new TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        onPressed: (){
           dialogs.information(context, 'Do you want to invite someone else?', 'push the ok button');
        },
      
      ),
      
    
        
    ],
    
    ),
  
    
    
  );
  Widget success = new Container(
    child: new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    
    children: <Widget>[
       new Icon(Icons.stop, color: Colors.red,),
       new FlatButton(
        child: new Text('Success', style: new TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        onPressed: (){
           dialogs.information(context, 'Congraturation!', 'Thank you');
        },
      
      ),

    ]),
  );


  final center = new Center(
    child: sizedBox,
  );
 
   return new MaterialApp(
     title: "",
     home: new Scaffold(
       appBar: new AppBar(
         backgroundColor: Colors.red[200],
      // title: new Text("Hello")
     ),
     drawer: new MenuPage(),
     body: Center(
    child:  new ListView(
       children: <Widget>[
        center,
        fourButtonsSection,
        success
       ],
     )  
     )
     )
   );

 } 
}


//   return new MaterialApp(
//     title: "",
//     home: MainPage()
 //  );
// }
//}




 */