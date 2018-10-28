import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'gloals.dart' as globals;
import 'menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ourPosing.dart';

final FirebaseApp app = FirebaseApp
  (  
      options : FirebaseOptions(
    googleAppID: '1:297718011993:android:2b3685a1f6154871',
    apiKey: 'AIzaSyBzSY-SXuZ52uOOy59-tXESQOaTSNDMqQg',
    databaseURL: 'https://codingtalkrc.firebaseio.com',
), name:"[DEFAULT]"
);

class Home extends StatefulWidget{
  HomeState createState() =>HomeState();
}

class HomeState extends State<Home>{
  


  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void initState(){
    super.initState();
    item = Item("","","");
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    itemRef = database.reference().child('myPosting').child(globals.userUID);
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
    

    if(form.validate() ){
       form.save();
       form.reset();
       itemRef.push().set(item.toJson());
     }
  
   }





  Widget build(BuildContext context){

    var user= FirebaseAuth.instance.currentUser();
    var name, email, uid;

    String currentUID;
    return Scaffold(
      
     appBar: AppBar(
        backgroundColor: Colors.red[200],
       // title: Text(widget.title),
       title: Text("Posting"),
       actions: <Widget>[
         IconButton(
           //color: Color(Colors.lightBlue),
           icon: Icon(Icons.person),
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
                     leading: Icon(Icons.date_range,color: Colors.red,),
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
                       // item.uid=globals.userUID;
                        item.name=globals.userName;
                      },
                       validator: (val) => val == " "?val: null,
                     ),
                   ),
                   ListTile(
                     
                     leading: Icon(Icons.attach_file,color: Colors.red,),
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
                       validator: (val) => val == " "?val: null,
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
      new FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
       // if (snapshot.connectionState == ConnectionState.done) {
          currentUID=snapshot.data.uid;
          return new Text("");
      },
    ),

       Flexible(
         child: FirebaseAnimatedList(
            query: itemRef,
           itemBuilder: (BuildContext context, DataSnapshot snapshot,
           Animation<double> animation, int index){
            //if(itemRef.key==currentUID){
              print("my");
             return new ListTile(
               leading: Icon(Icons.favorite, color: Colors.red,),
               
               title: items[index].title==null?'empty':Text(items[index].title),
               subtitle: items[index].body==null?'empty':Text(items[index].body),              

             );//}
           
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
        name=snapshot.value["name"];
    

  toJson(){
    return {
     // "uid": uid,
      "name" : name,
      "title": title,
      "body" : body,
      

    };
  }
}


