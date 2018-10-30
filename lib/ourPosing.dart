
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'gloals.dart' as globals;
import 'menu.dart';
import 'myPosting.dart';

final FirebaseApp app = FirebaseApp
  (  
      options : FirebaseOptions(
    googleAppID: '1:297718011993:android:2b3685a1f6154871',
    apiKey: 'AIzaSyBzSY-SXuZ52uOOy59-tXESQOaTSNDMqQg',
    databaseURL: 'https://codingtalkrc.firebaseio.com',
), name: "[DEFAULT]");

class Home2 extends StatefulWidget{
  HomeState2 createState() =>HomeState2();
}

class HomeState2 extends State<Home2>{
  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2019),
    );
    if(picked != null) setState(() => _value = picked.toString());
  }



  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void initState(){
    super.initState();
    item = Item("","","");
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    itemRef = database.reference().child('ourPosting');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);

   // itemRef = FirebaseDatabase.instance.reference().child('items');
   }

   _onEntryAdded(Event event){
     setState(() {
           items.add(Item.fromSnapshot(event.snapshot));
          });
   }

   _onEntryChanged(Event event){
     var old = items.singleWhere((entry){
       return entry.key == event.snapshot.key;
     }    
   );

    setState(() {
          items[items.indexOf(old)] =Item.fromSnapshot(event.snapshot);
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





  Widget build(BuildContext context){
    
    return Scaffold(
      
     appBar: AppBar(
        backgroundColor: Colors.red[200],
        // title: Text(widget.title),
       title: Text("Posting"),
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.person
           
          ),
          onPressed: (){
                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()));
          }
         ),
         IconButton(
           icon: Icon(Icons.people),
          onPressed: (){
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home2()));
          }
         )
       ],
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
                   ListTile(
                     leading: Icon(Icons.date_range,color: Colors.deepOrange[200],),
                     title: TextFormField(
                       decoration: InputDecoration(
                                  hintText: 'DATE',
                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                       border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(32.0)
                      ),
                  ),
                       
                       
                       initialValue: "",
                       //onSaved: (val)=> item.title = val,
                      onSaved: (val){
                        item.title = val;
                        //item.uid=globals.userUID;
                        item.name=globals.userName;
                      },
                       //validator: (val) => val == " "?val: null,
                     ),
                   ),
                   ListTile(
                     
                     leading: Icon(Icons.attach_file,color: Colors.deepOrange[200],),
                     title: TextFormField(
                         maxLines: 5,
                         keyboardType: TextInputType.multiline,
                         //maxLines: whatever,
                       decoration: InputDecoration(
                                  hintText: 'Contents',
                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                       border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(32.0)
                      ),
                  ),
                       
                       initialValue: '',
                       onSaved: (val) => item.body = val,
                       //validator: (val) => val == " "?val: null,
                     ),
                   ),
                     IconButton(
                       icon: Icon(Icons.send),
                       onPressed: (){
                         handleSubmit();
                       },
                       ),
                 ],
               ),
             ),
           ),),
       Flexible(
         child: FirebaseAnimatedList(
         query: itemRef,
         itemBuilder: (BuildContext context, DataSnapshot snapshot,
           Animation<double> animation, int index){
          //  if(items[0].uid!=null && items[0].body!=null && items[0].title!=null &&items[0].key!=null){
             return new ListTile(
               //leading: Icon(Icons.message),
               leading: Icon(Icons.favorite, color: Colors.deepOrange[200],),
               title: items[index].title==null && items[index].name==null?'empty':Text(items[index].name+" "+items[index].title),
               subtitle:items[index].body==null?'empty': Text(items[index].body),
              trailing:
               IconButton(icon: Icon(Icons.delete), onPressed: (){
                 print('삭제');
               }),
               /* children: <Widget>[
                  Icon(Icons.delete),
                  Icon(Icons.format_color_text)
                ],
                */

              //subtitle: Text(items[index].uid)



               onTap: (){

                 showDialog(
                     context: context,
                     barrierDismissible: true,
                     builder: (BuildContext context){
                       return AlertDialog(
                         title: Text(items[index].name+" "+items[index].title),
                         content: SingleChildScrollView(
                           child: ListBody(
                             children: <Widget>[
                               Text('오오오오ㅗㅇ')
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
               },



             );
            }
           
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
  String name;

  Item(this.name,this.title, this.body);

 Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
       // uid=snapshot.value["uid"],
        title = snapshot.value["title"],
        body = snapshot.value["body"],
        name = snapshot.value["name"];

  toJson(){
    return {
      //"uid": uid,
      "title": title,
      "body" : body,
      "name" : name,

    };
  }
}

