/*
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login5/Dialogs.dart';
import 'gloals.dart' as globals;
import 'menu.dart';
import './gauge.dart';

final FirebaseApp app = FirebaseApp
  (  
      options : FirebaseOptions(
    googleAppID: '1:297718011993:android:2b3685a1f6154871',
    apiKey: 'AIzaSyBzSY-SXuZ52uOOy59-tXESQOaTSNDMqQg',
    databaseURL: 'https://codingtalkrc.firebaseio.com',
), name: "[DEFAULT]");

class Home3 extends StatefulWidget{
  HomeState3 createState() =>HomeState3();
}

class HomeState3 extends State<Home3>{


  List<Item> success = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void initState(){
    super.initState();
    item = Item("","");
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    itemRef = database.reference().child('success');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);

   }

   _onEntryAdded(Event event){
     setState(() {
            success.add(Item.fromSnapshot(event.snapshot));
          });
   }

   _onEntryChanged(Event event){
     var old = success.singleWhere((entry){
       return entry.key == event.snapshot.key;
     }    
   );

    setState(() {
          success[success.indexOf(old)] =Item.fromSnapshot(event.snapshot);
          
        });
   }

   

   void handleSubmit(){
     final FormState form = formkey.currentState;

     if(form.validate()){
       form.save();
       form.reset();
       itemRef.push().set(item.toJson());
     }
   }

 Dialogs dialogs = new Dialogs();



  Widget build(BuildContext context){

    int count=0;
   
    CustomSlider gauge = new CustomSlider(
    
      percentage: globals.ourCount2 = globals.ourCount+0.0 ,
      positiveColor: Color(0xFFEF0078),
      negetiveColor: Color(0xFFFFFFFF),
    );

    return Scaffold(
      
     appBar: AppBar(
       backgroundColor: Colors.red[200],
      ),
      drawer:MenuPage(),
     resizeToAvoidBottomPadding: false,
    
     body: Column(
       children: <Widget>[
         Flexible(
           flex: 0,
           child: Center(
             child: Form(
               key: formkey,
               child: Flex(
                 direction: Axis.vertical,
                 children: <Widget>[
                   SizedBox(height: 25.0),
                   gauge,
                   Text(globals.ourCount2.toString()+'%'),
          //           new Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
          //              children: <Widget>[
          //                new Icon(Icons.save_alt, color: Colors.red,),
          //                new FlatButton(
          //              child: new Text('Posting', style: new TextStyle(fontSize: 20.0,
          //              fontWeight: FontWeight.w600,color: Colors.blue),
          //              ),
          //              onPressed: (){
          //                item.title=globals.userName;
          //                handleSubmit();
          //                setState(() {
          //                   gauge.percentage = globals.ourCount2;
          //                 });
          
          //              dialogs.information(context, 'Mission success! The mission was delivered to three people.', 'Wow');
          //                },
          //               ),
                      
          //        ],
          //      ),
               
          //      )
          //  ),),
            
                    // IconButton(
                    //    icon: Icon(Icons.send),
                    //    onPressed: (){
                    //      globals.myCount=0;
                    //      item.title=globals.userName;
                    //      handleSubmit();
                    //      setState(() {
                    //         gauge.percentage = globals.ourCount2;
                    //       });
                    //    },
                    //    ),
                       SizedBox(height: 40.0),
                       new RaisedButton(
                        color: Colors.amber[50],
                        child: new Text('Success!', style: new TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.w600,color: Colors.blue),
                        ),
                       onPressed: (){
                          item.title=globals.userName;
                          handleSubmit();
                          setState(() {
                             gauge.percentage = globals.ourCount2;
                          });
          
                       dialogs.information(context, 'Mission success! \n The mission was delivered to three people.', 'push the ok button');
                     },
                        ),
                       
                      
                 ],
               ),
               
               )
           ),
           ),
           SizedBox(height: 15.0),
           new Align(
             alignment: Alignment.bottomLeft,
             child: new Text('    Today \'s people of achievement', style: new TextStyle(fontSize: 17.0,
                  fontWeight: FontWeight.w600,color: Colors.black),
                ),),
          
          //  Flexible(
          //    child: new Text('people of achievement', style: new TextStyle(fontSize: 20.0,
          //               fontWeight: FontWeight.w600,color: Colors.blue),
          //               ),),
      
       Flexible(
         
         child: FirebaseAnimatedList(
           
           query: itemRef,
           
           itemBuilder: (BuildContext context, DataSnapshot snapshot,
           Animation<double> animation, int index){
              //globals.myCount=0;
           //if(success[index].uid==globals.userUID){
            // globals.myCount+=1;
            print(index);
            globals.ourCount=(index+1)*10;
            globals.ourCount2 = (index+1.0)*10.0;
            count=1;
           
            
          //  return new GridView.count(
          //    crossAxisCount: 3,
          //    children: new List<Widget>.generate(16, (index){
          //      return new GridTile(
          //        child: new Card(
          //          color: Colors.orange,
          //          child: ListTile(
          //             leading: Icon(Icons.favorite, color: Colors.red,),
          //             title: success[index].title==null?'empty':Text(success[index].title),
          //             subtitle: success[index].body==null?'empty':Text(success[index].body),
          //          ),
          //        ),
          //      );
          //    },
          //  ));
           return new ListTile(
            

               leading: Icon(Icons.favorite, color: Colors.red,),
               title: success[index].title==null?'empty':Text(success[index].title),
               subtitle: success[index].body==null?'empty':Text(success[index].body),
               
              

             );
             
           }

          
           //}
         ),
         
          
       ),
       
       
       ],
     ),
     
    );
  }
}


class Item{
  //String userName=globals.userName;
  String key;
  //String uid;
  String title;
  String body;

  Item(this.title, this.body);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        //key=snapshot.value["uid"],
        //uid=snapshot.value["uid"],
        title = snapshot.value["title"],
        body = snapshot.value["body"];

  toJson(){
    return {
      //"uid": uid,
      "title": title,
      "body" : body

    };
  }
}

*/