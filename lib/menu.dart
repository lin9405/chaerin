import 'package:flutter/material.dart';
import 'gloals.dart' as globals;
import 'login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'main.1.dart';
import 'My_page.dart';
import 'myPosting.dart';
import 'ourPosing.dart';
import 'mainPageMH.dart';



class MenuPage extends StatefulWidget{
  static String tag ='register-page';
  _MenuPageState createState() => new _MenuPageState();

}


class _MenuPageState extends State<MenuPage> {
  String _path;
  

  /*Future<Null> uploadFile(String filepath) async{
   
    

    final ByteData bytes = await rootBundle.load(filepath);
    final Directory tempDir = Directory.systemTemp;
    final String fileName = "${Random().nextInt(10000)}.jpg";
    final File file = File('${tempDir.path}/$fileName');
    file.writeAsBytes(bytes.buffer.asInt8List(),mode: FileMode.write);
    
    final StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask task = ref.putFile(file);
    final Uri downloadUrl = (await task.future).downloadUrl;
    _path = downloadUrl.toString();

    print(_path);
    
  }*/

  /*Future<Null> downloadFile(String httpPath) async{
   // if()
  }*/

//class menuPage extends StatelessWidget {
  //File menuimage;
 
  Widget build(BuildContext context)
  {

    
   /* return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
       // title:new Text("data"),
    ),*/
    //drawer:
     return new Drawer(
      child: new ListView(
        
        children: <Widget>[
          
          new UserAccountsDrawerHeader(
            //ecoration: new ,
            accountName: new Text(globals.userName),
            accountEmail: new Text(globals.userEmail),
            decoration: new BoxDecoration( color: Colors.red[200]),
           // decoration: new Color(red),
          // decoration: Colors.red,
            currentAccountPicture: new Container(//new CircleAvatar(
              
              //backgroundColor: Colors.white,
              //backgroundImage: globals.image == null? new Text('No image'):new Image.file(globals.image),
              //child: new Text("P"),
              width: 80.0,
              height: 80.0,
              //decoration: ,
              /*decoration: new BoxDecoration(
                shape: BoxShape.circle,
                
              ),*/
              child: globals.image == null? new Text('No image'):new Image.file(globals.image),
              color: Colors.red[100],
              
            ),
           otherAccountsPictures: <Widget>[
            
             new FloatingActionButton(
               backgroundColor: Colors.white,
               //color: Colors.blueAccent,
               onPressed: picker,
               child: new Icon(Icons.camera_alt,color: Colors.red[200],),
             )
           ],
          ),
        
          new ListTile(
            title: new Text("Main"),
            
            trailing: new Icon(Icons.arrow_right),
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home3()));
            },
            
            
          ),
           new ListTile(
            title: new Text("My Posting"),
            trailing: new Icon(Icons.arrow_right),
             onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()));
            },
          ),
           new ListTile(
            title: new Text("Our Posting"),
            trailing: new Icon(Icons.arrow_right),
             onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home2()));
            },
          ),
        /*   new ListTile(
            title: new Text("Test"),
            trailing: new Icon(Icons.arrow_right),
             onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home3()));
            },
          ),*/
       /*    new ListTile(
            title: new Text("Test2"),
            trailing: new Icon(Icons.arrow_right),
             onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Home4()));
            },
          ),*/
         
           new ListTile(
            title: new Text("My Page"),
            trailing: new Icon(Icons.arrow_right),
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            
          ),
          new Divider(),
          new ListTile(
            title: new Text("Sign Out"),
            trailing: new Icon(Icons.close),
            onTap: (){ 
              globals.i=1;
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()));

              }
                     
           ),
          //new Divider(),
          new ListTile(
            title: new Text("Close"),
            trailing: new Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
     );
    
   //);
  }

  picker() async{
   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
   if(img!=null){
     //imagePath=img.path;
     print(img.path);
     //await uploadFile(img.path);
     globals.image=img;
   // menuimage=img;
     setState(() {
      
      });
   }
 
  }
}
