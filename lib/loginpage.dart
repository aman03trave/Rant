import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
class lgpage extends StatefulWidget {
  const lgpage({super.key});

  @override
  State<lgpage> createState() => _lgpageState();
}

class _lgpageState extends State<lgpage> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String pass1){
    final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return passRegex.hasMatch(pass1);
  }

  bool validateForm() {
    if (email.text.isEmpty || pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return false;
    }
    if (!isValidEmail(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email format.")),
      );
      return false;
    }

    if (!isValidPassword(pass.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            "Invalid password format.Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character. ")),
      );
      return false;
    }
    return true;
  }

  Future<void> LoginForm() async {

    if (!validateForm()) {
      return;
    }
    final url = Uri.parse("http://192.168.29.8:3000/loginuser");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email.text, 'password': pass.text}),
      );


          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login successful!")));

        // Redirect to Dashboard

      } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed. Please check your credentials.")));
    }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to connect to the server.")));
    }
  }





    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                )
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                onPressed: LoginForm,
                child: Text("Login"))
          ]
      ),
    );
  }
}

