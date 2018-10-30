


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'gloals.dart' as globals;
import 'dart:async';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

//File image;

class RegisterPage extends StatefulWidget{
  static String tag ='register-page';
  _RegisterPageState createState() => new _RegisterPageState();

}


class _RegisterPageState extends State<RegisterPage> {

  //File image;
  String _name;
  String _id;
  String _password;
  String _confirmPassword;
  String _email;

  final formKey= new GlobalKey<FormState>();

  bool validateAndSave()
  {
    final form = formKey.currentState;
    form.save();
    if(form.validate()){
      //form.save();//onSave에 해당하는 거 실행.
      form.reset();//입력 칸 비우기.
      //print('Form is valid. id:$_id, password:$_password');
      return true;
    }/*else{
      print('Form is invalid');
    }*/
    return false;
  }

  void validateAndSubmit() async{ 
    if(validateAndSave()){
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         print('Registered user: ${user.uid}');
        confirmDialog1();
        //if(_formType==FormType.login){
      //FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(ID: _id,Password: _password);     
      //print('Signed in: ${user.uid}');
      }//else{
      //FirebaseUser user = await FirebaseAuth.instance.createUserWithAndPassword(ID: _id,Password: _password);
      //print('Signed in: ${user.uid}');
      //}

      //}
      catch(e)
      {
        print('Error: $e');
      }
    }
  }

  Widget build(BuildContext context){    
   
      return new Scaffold(
        appBar:AppBar(
          title: Text('Sign Up'),
          backgroundColor: Colors.red[200],) ,
        backgroundColor: Colors.white,
        body: Center(
            child: new Form(
              key: formKey,
              child: new ListView(
                shrinkWrap: true,//Scrollable
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: buildInputs()
              ),
            )
        )
    );

  }

   List<Widget> buildInputs(){

    return[
      
     new FloatingActionButton(
       onPressed: picker,
       child: new Icon(Icons.camera_alt),
     ),
     SizedBox(height: 10.0),
  
     new Container(
      child: new Center(
        child: globals.image == null? new Text('Choose a profile picture.'):new Image.file(globals.image),
      ),
     ),
     SizedBox(height: 20.0),

     new TextFormField(
     // autofocus: false,
      //initialValue: 'alucrd@gamail.com',
      decoration: InputDecoration(
        hintText: 'NAME',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
     validator: (value) =>value.isEmpty ? 'Name can\'t be enpty':null,
     onSaved: (value) =>_name =value,
     ),

     SizedBox(height: 10.0),

     new TextFormField(
     // autofocus: true,
      //initialValue: 'alucrd@gamail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) =>_email =value,
     ),

     SizedBox(height: 10.0),


     new TextFormField(
      //keyboardType: TextInputType.emailAddress,
     //  autofocus: true,
      obscureText: true,
      //initialValue: 'alucrd@gamail.com',
      decoration: InputDecoration(
        hintText: 'PASSWORD',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      validator: (value) =>value.isEmpty ? 'Password can\'t be enpty':null,
      onSaved: (value) =>_password =value,
     ),

     SizedBox(height: 10.0),

     new TextFormField(
      //keyboardType: TextInputType.emailAddress,
     // autofocus: true,
      obscureText: true,
      
      //initialValue: 'alucrd@gamail.com',
      decoration: InputDecoration(
        hintText: 'CONFIRM PASSWORD',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      validator: (value) =>!value.contains(_password) ? 'Your password doesn not match':null,
      onSaved: (value) =>_confirmPassword =value,
     ),

     SizedBox(height: 10.0),

     new Padding(
       padding: EdgeInsets.symmetric(vertical: 16.0),
       child: Material(
         borderRadius: BorderRadius.circular(30.0),
         shadowColor: Colors.redAccent.shade100,
         elevation: 5.0,
         child: MaterialButton(
           minWidth: 200.0,
           height: 46.0,
           onPressed: validateAndSubmit,
           color: Colors.red[200],
           child: Text('become a member',style: TextStyle(color: Colors.white)), 
              ),
       ),
      )
    ];
   }

   String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Not a valid email.';
    else
      return null;
  }
  picker() async{
   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
   if(img!=null){
     print(img.path);
     globals.image=img;
     setState(() {
        
      });
   }
 
  }

Future<bool> confirmDialog1(){
    return showDialog<bool>(
      context:  context,
      barrierDismissible: false, //user must tap button!
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text('Thank you!'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('You are welcom'),
              onPressed: (){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
              },
            )
          ],
        );
      }
    );
  }

  }




