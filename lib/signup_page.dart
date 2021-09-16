import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController usernameTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  
  FirebaseAuth auth=FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.reference().child("Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Register Page"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                controller: emailTextEditingController,
                //  keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    labelText: "email"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameTextEditingController,
                //  keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    labelText: "Username"
                ),
              ),
            ),




            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordTextEditingController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    labelText: "Password"
                ),
              ),
            ),

            RaisedButton(
              onPressed: (){

                register_account();
              },
              child: Text("Register"),



            ),

            FlatButton(
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text("already have an account! Login here"),



            ),

          ],
        ),


      ),
    );
  }

  void register_account()async {
    
    if(emailTextEditingController.text.isEmpty){
      
      Fluttertoast.showToast(msg: "Please Enter the email. . ..");
    }
    else if(usernameTextEditingController.text.isEmpty){

      Fluttertoast.showToast(msg: "Please Enter the username. . ..");
    }
    else if(passwordTextEditingController.text.isEmpty){

      Fluttertoast.showToast(msg: "Please Enter the Password. . ..");
    }
    else{


      auth.createUserWithEmailAndPassword(email: emailTextEditingController.text,
          password: passwordTextEditingController.text).catchError((error){

            Fluttertoast.showToast(msg: error.toString());
      });

      if(auth.currentUser!=null){

        Map map={

          "username":usernameTextEditingController.text,
          "email":emailTextEditingController.text
        };

        ref.child(auth.currentUser.uid).set(map);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationPage()));
      }

     // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));

    }

  }
}