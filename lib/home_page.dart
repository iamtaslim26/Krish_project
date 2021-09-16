import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSignedin=false;
 FirebaseAuth auth=FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.reference().child("Users");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    auth.onAuthStateChanged.listen((userInfo) {

      if(userInfo!=null){

        setState(() {

          isSignedin=true;
        });
      }
      else{

        setState(() {
          isSignedin=false;
        });

      }
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  var retriveName="";
  var retriveEmail="";


  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth=FirebaseAuth.instance;
    DatabaseReference ref=FirebaseDatabase.instance.reference().child("Users");
    ref.child(auth.currentUser.uid).once().then(( DataSnapshot snapshot) {


      //   print("result=  "+snapshot["email"].toString());

      setState(() {

        retriveEmail=snapshot.value["email"];
        retriveName=snapshot.value["username"];

      });

      

      // print("result = "+retriveEmail);
      // print("result2.0 = "+retriveName);

    });
    return Scaffold(
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [


            Text(retriveEmail), //dekhabo
            Text(retriveName),
          ],
        ),
      ),
    );
  }
}

