import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishworks_app/UserDetails.dart';
import 'package:krishworks_app/controller_login.dart';
import 'package:krishworks_app/home_page.dart';
import 'package:krishworks_app/signup_page.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.reference().child("Users");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
        ),
      //  backgroundColor: Colors.white,
        body:loginUIController()


       /*body: Center(
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
                controller: passwordTextEditingController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    labelText: "Password"
                ),
              ),
            ),

            RaisedButton(
              onPressed: () {
                loginUser();
              },
              child: Text("Login"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text("Don't have an account?Register here"),

            ),



          ],
        ),


      ),

       */
    );
  }

}

 /* void loginUser() async {
    if (emailTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter the email. . ..");
    }

    else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter the Password. . ..");
    }
    else {
    final User user= (await auth.signInWithEmailAndPassword(email: emailTextEditingController.text,
          password: passwordTextEditingController.text).catchError((error){

       Fluttertoast.showToast(msg: error.toString());
     })).user;

     if(user!=null){

    ref.child(auth.currentUser.uid).once().then((DataSnapshot sanp){

      if(sanp!=null){

        Fluttertoast.showToast(msg: "Logged in");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationPage()));
      }
      else{
        Fluttertoast.showToast(msg: "Failed....");

      }

    });

     }


    }
  }
  
  */
loginUIController() {

  Consumer<ControllerLogin>(

      builder: (context,model,child){

        if(model.userDetailsModel!=null){

          return Center(

            // User is already logged in   homepage

            child: alreadyLoggedInScreen(model),
          );
        }
        else{

          // Not Logged in

          return NotLoggedInScreen();
        }
      }
  );


}
alreadyLoggedInScreen(ControllerLogin model) {
  
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    
    children: [
      
      CircleAvatar(
        backgroundImage: Image.network(model.userDetailsModel!.photoURL??"").image,
        radius: 100,
      ),

      SizedBox(height: 20,),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.black,

          ),
          SizedBox(
            width: 20,
          ),

          Text(
            model.userDetailsModel!.displayName??"",
            style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black
            ),
          )
        ],
      ),

      SizedBox(height: 20,),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.black,

          ),
          SizedBox(
            width: 20,
          ),

          Text(
            model.userDetailsModel!.email??"",
            style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
            ),
          )
        ],
      ),

      SizedBox(height: 20,),

      RaisedButton(
          onPressed: (){
            //Provider.of<ControllerLogin>(context,listen: true).allowUserToLogout();
          },
        child: Text("Logout"),
      )
    ],
    
  );
}

NotLoggedInScreen () {
  return Center(

    child: Column(

      children: [

        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Google Login2.o",
          style: TextStyle(color: Colors.black),),
        ),

        GestureDetector(
          onTap: () {


          },

          child: Text("Google Login"),
        )
      ],
    ),
  );

}

