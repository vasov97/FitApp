import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../auth/google_sign_in.dart';

class UserProfile extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold
    (
      appBar: AppBar
      (
        actions: 
        [
          TextButton(child:Text('Logout',style: TextStyle(color: Colors.white),),
          onPressed: ()
          {
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.googleLogout();
          },)
        ],
      ),
      body: Container
      (
        alignment: Alignment.center,
        color: Colors.blueGrey.shade500,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
        [
          CircleAvatar
          (
            radius: 50,
            backgroundImage: NetworkImage(currentUser!.photoURL!),
          ),
          SizedBox(height: 20,),
          Text(currentUser.displayName.toString(),style: TextStyle(color: Colors.white),),
          SizedBox(height: 20,),
          Text(currentUser.email.toString(),style: TextStyle(color: Colors.white)),
        ]),
      ),
    );  
  }
}