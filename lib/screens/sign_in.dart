// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../auth/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> 
{
  
  @override
  Widget build(BuildContext context) 
  {
    final imageHeight = MediaQuery. of(context). size. height *0.27;
    final imageWidth = MediaQuery. of(context). size. width * 0.5;
    
    return SafeArea(
      child: Scaffold
        (
          backgroundColor: const Color.fromARGB(255, 212, 212, 212),
          body: SafeArea(
            child: Center(
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                children: 
                [
                   Stack(
                     children:
                     [
                       Column(
                       children: [
                         Row
                         (
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: 
                         [
                           // ignore: sort_child_properties_last
                           Container
                           (
                           decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/images/workout.jpg'),fit: BoxFit.fill)),
                           width: imageWidth,
                           height: imageHeight,
                           child: BackdropFilter
                           (
                           filter: ImageFilter.blur(sigmaX: 2.0,sigmaY: 2.0),
                           child: Container(decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),),
                           ),
                           ),
                         ]),
                        Row
                     (
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: 
                     [
                        Container
                       (
                       decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/images/food.jpg'),
                       fit: BoxFit.fill, )),
                       width: imageWidth,
                       height: imageHeight,
                       child: BackdropFilter
                       (
                       filter: ImageFilter.blur(sigmaX: 2.0,sigmaY: 2.0),
                       child: Container(decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),),
                       ),
                       ),
                     ]),
                       ],
                     ),
                    Padding(
                      padding: EdgeInsets.only(left: imageWidth/2,top: imageWidth/2),
                      child: Container(width: imageWidth,height:imageHeight,color: Colors.grey,child: Center(child: Text('Closer to a \n better life',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),))),
                    ),
                     ]
                   ),
                   SizedBox(height: 100,),
                   Text('Sign in',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                   SizedBox(height: 30,),
                   ElevatedButton(onPressed: ()
                   {
                     final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                     provider.googleLogin(context);
    
                   },style: ElevatedButton.styleFrom
                   (
                    fixedSize: Size(50,60),
                    shape:CircleBorder(),
                    elevation: 3,
                    primary: Colors.white,
                   ), child: Image.asset('assets/images/google.png')),
                ]
              ),
            ),
          ),
      ),
    );
  }
}