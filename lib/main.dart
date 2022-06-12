import 'package:fit_app/auth/google_sign_in.dart';
import 'package:fit_app/screens/profile.dart';
import 'package:fit_app/screens/sign_in.dart';
import 'package:fit_app/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context)  => ChangeNotifierProvider
  (
      create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Fit. Healthy. Happy.',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Profile(),
      ),
    );
}



  
            
