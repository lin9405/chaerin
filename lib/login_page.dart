

import 'package:flutter/material.dart';
import 'register_page.dart';
import 'findPassword.dart';
import 'findID.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'gloals.dart' as globals;
import 'main.1.dart';
import 'mainPageMH.dart';


class LoginPage extends StatefulWidget{
  static String tag ='login-page';
  _LoginPageState createState() => new _LoginPageState();
}

/*class CircleClipper extends CustomClipper<Rect>{
  Rect getClip(Size size){
    return Rect.fromCircle(
      center: Offset(size.width/2, size.height/2), 
      radius: min(size.width, size.height)/2
    );
    
  }
}*/

class _LoginPageState extends State<LoginPage>{
 
  
   
 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken, accessToken: gSA.accessToken);
      print('User Name: ${user.displayName}');
      globals.userName=user.displayName;
      globals.userEmail=user.email;
      globals.userUID=user.uid;
  
      /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()));*/
       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home3()));
      return user;
      }

    void _signOut(){
    globals.myCount=0;
    globals.ourCount=0;
    googleSignIn.signOut();
    print('User signed out');
  
      }

  /*final formKey= new GlobalKey<FormState>();
  String _email;
  String _password;

  bool validateAndSave()
  {
    final form = formKey.currentState;
    //form.save();
    if(form.validate()){
      form.save();//onSave에 해당하는 거 실행.
      form.reset();//입력 칸 비우기.
      //print('Form is valid. id:$_id, password:$_password');
      return true;
    }//else{
      //print('Form is invalid. id:$_id, password:$_password');
    //}
    return false;
  }

  void validateAndSubmit() async{ 
    if(validateAndSave()){
      try{
         FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         print('Sign in: ${user.uid}');
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
  }*/

  Widget build(BuildContext context){
 

       return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: new Form(
              //key: formKey,
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
     if(globals.i==1)
     { _signOut();
      // globals.i=0;
     }
     globals.i=0;

    return[

      SizedBox(height: 45.0),
      new Container(
      child: new ClipOval(
        //clipper: CircleClipper(),
        child: Image.asset('assets/snuppy.jpg'),
      ),
     ), 
     SizedBox(height: 48.0),

     new Padding(
     //  padding: EdgeInsets.symmetric(vertical: 16.0),
       padding: EdgeInsets.fromLTRB(65.0, 0.0, 65.0, 120.0),
       child: Material(
         borderRadius: BorderRadius.circular(30.0),
         shadowColor: Colors.redAccent.shade100,
         elevation: 0.0,
         child: MaterialButton(
           padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
           minWidth: 150.0,
           height: 46.0,
           onPressed: ()=> _signIn()
            .then((FirebaseUser user) => print(user))
            .catchError((e)=>print(e)),
    
           color: Color.fromRGBO(250, 140, 140, 1.0),
           child: 

               
               Text('Google Log In',style: TextStyle(color: Colors.white)), 

           
              ),
       ),
       ),
       SizedBox(height: 6.0),


/*
       new FlatButton(
         child: Text('become a member', style: TextStyle(color: Colors.black45),
         ),
         onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
         }
       ),
       SizedBox(height: 5.0),
       new FlatButton(
         child: Text('Forgot id?', style: TextStyle(color: Colors.black45),
         ),
         onPressed: (){
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => findIdPage()),
            );
         },
       ),
       SizedBox(height: 6.0),

       new FlatButton(
         child: Text('Forgot password?', style: TextStyle(color: Colors.black45),
         ),
         onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => findPasswordPage()),
            );
         },
       ),
       */
       SizedBox(height: 6.0),
     


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
}



