import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mail_app/interface_mail.dart';


class SignIn extends StatefulWidget{
  const SignIn({Key ? key}) : super (key: key);
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  @override
  void initState(){
    super.initState();
    _controller1=TextEditingController();
    _controller2=TextEditingController();
  }

  @override
  void dispose(){
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
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
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const  Text(
              "SignIn",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            "Speak, friend, and enter",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 120, 50, 20),
            child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
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
           child: TextField(
                controller: _controller2,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
            ),
         ),
         Container(
           padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
           child:  OutlinedButton( 
                onPressed: () {
                  if(_controller1.text==_controller2.text){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoadingSignIn()));
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignFailed()));
                  }
                  setState(() {});
                },
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
        backgroundColor: Colors.cyan,
        body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100,bottom: 50),
            child: Center(
              child: Ink(
                width: 300,
                height: 150,
                decoration: const ShapeDecoration(
                  color: Colors.cyan,
                  shape: CircleBorder(),
                ),
                child: const Icon(
                Icons.cancel,
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
         const Text("Please,Try again."),
          Container(
           padding: const EdgeInsets.fromLTRB(50, 150, 50, 50),
           child:  OutlinedButton( 
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'TRY AGAIN',
                  style: TextStyle(
                    color: Colors.white,
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
