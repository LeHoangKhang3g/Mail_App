import 'dart:html';

import 'package:flutter/material.dart';


class SignIn extends StatefulWidget{
  const SignIn({Key ? key}) : super (key: key);
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Ink(
                width: 300,
                height: 150,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: const Icon(
                Icons.mail,
                  color: Colors.cyan,
                  size: 90,
                ),
              ),
            ),
          ),
          const  Text(
            "SignIn",
            style: TextStyle(
              fontSize: 55,
              color: Colors.white,
            ),
          ),
         const Text("Speak, friend, and enter"),
         Container(
           padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
           child:  const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Email',
                ),
            ),
         ),
         Container(
           padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
           child:  const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
            ),
         ),
         Container(
           padding: const EdgeInsets.fromLTRB(50, 150, 50, 50),
           child:  OutlinedButton( 
                onPressed: () {},
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.resolveWith((states) => Colors.black),
                  fixedSize: MaterialStateProperty.resolveWith((states) => const Size(1500,50)), 
                ),
            ),
            ),
        ],
      ),
    );
  }
}

class SignFailed extends StatefulWidget{
    const SignFailed({Key ? key}) : super (key: key);
    @override
    _SignFailedState createState() => _SignFailedState();
  }
  class _SignFailedState extends State<SignFailed> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Ink(
                width: 300,
                height: 150,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: const Icon(
                Icons.mail,
                  color: Colors.cyan,
                  size: 90,
                ),
              ),
            ),
          ),
          const  Text(
            "UPS... conuldn't Sign In",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
         const Text("Your username and password don't match."),
         const Text("Please,Try again"),
          Container(
           padding: const EdgeInsets.fromLTRB(50, 150, 50, 50),
           child:  OutlinedButton( 
                onPressed: () {},
                child: const Text(
                  'TRY AGAIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.resolveWith((states) => Colors.black),
                  fixedSize: MaterialStateProperty.resolveWith((states) => const Size(1500,50)), 
                ),
            ),
            ),
        ],

      ),
    );

  }
}
/*
class LoadingSignIn extends StatefulWidget{
  
} 
*/
