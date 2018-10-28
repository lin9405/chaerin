import 'package:flutter/material.dart';

class findIdPage extends StatefulWidget{
  static String tag ='register-page';
  _findIdPageState createState() => new _findIdPageState();

}
//check - hyunji

class _findIdPageState extends State<findIdPage> {

  String _name;
  String _email;

  final formKey= new GlobalKey<FormState>();

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
          backgroundColor: Colors.red[200],) ,
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
           child: Text('Find my ID',style: TextStyle(color: Colors.white)), 
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