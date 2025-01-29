import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Loginpage());
}
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lgpage());
    //   routes: {
    //     '/singup': (context) => Signuppage(),
    //     '/login' : (context) => Loginpage()
    // );
  }
}

class lgpage extends StatelessWidget {
  const lgpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
    );
  }
}

