
import 'package:flutter/material.dart';

import 'dart:async';
import 'login_page.dart';

class findPasswordPage extends StatefulWidget{
  static String tag ='register-page';
  _findPasswordPageState createState() => new _findPasswordPageState();

}


class _findPasswordPageState extends State<findPasswordPage> {

  String _name;
  String _id;
  String _email;

  final formKey= new GlobalKey<FormState>();

 /* void _handlePreesed(){
    //display dialog
    confirmDialog1().then((bool value){
      print('object');
    });

  }*/

  Future<bool> confirmDialog1(){
    return showDialog<bool>(
      context:  context,
      barrierDismissible: false, //user must tap button!
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text('I sent your password by email.'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('check'),
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

   bool validateAndSave()
  {
    final form = formKey.currentState;
    
    if(form.validate()){
      form.save();//onSave에 해당하는 거 실행.
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
       // _handlePreesed;
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
        backgroundColor: Colors.white,
         appBar:AppBar(

          title: Text('Find PassWord'),
          backgroundColor: Colors.red[200],),
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
      //keyboardType: TextInputType.emailAddress,
     // autofocus: false,
      //initialValue: 'alucrd@gamail.com',
      decoration: InputDecoration(
        hintText: 'ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      validator: (value) =>value.isEmpty ? 'ID can\'t be enpty':null,
      onSaved: (value) =>_id =value,
     ),

     SizedBox(height: 10.0),

     new TextFormField(
      //autofocus: false,
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
           child: Text('Find my password',style: TextStyle(color: Colors.white)), 
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


}




