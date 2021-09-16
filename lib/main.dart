import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishworks_app/Phone/loginscreen.dart';
import 'package:krishworks_app/controller_login.dart';
import 'package:krishworks_app/login_page.dart';
import 'package:krishworks_app/signup_page.dart';
import 'package:provider/provider.dart';



void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KrishWorkApp());
}

class KrishWorkApp extends StatelessWidget {
  const KrishWorkApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (context)=>ControllerLogin())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: LoginScreen(),
       
      ),
    );
  }
}
