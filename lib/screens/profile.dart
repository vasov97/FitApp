
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'sign_in.dart';
import 'user_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
     return Scaffold
     (
      body:StreamBuilder
      (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData) {
            
            return UserProfile();
          } else if (snapshot.hasError) {
            return const Center(child:Text('Something Went Wrong!'));
          } else {
           
            return const SignIn();
          }
        },
      ),
     );  
  }
}