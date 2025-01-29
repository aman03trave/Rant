import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(Signuppage());
}

class Signuppage extends StatelessWidget {

  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyFirst(),
        debugShowCheckedModeBanner: false
    );
  }
}

class MyFirst extends StatefulWidget {
  const MyFirst({super.key});


  @override
  State<MyFirst> createState() => _MyFirstState();
}

class _MyFirstState extends State<MyFirst> {
  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();

  String? selectedGender;

  Future<void> submitForm() async {
    final url = Uri.parse("http://192.168.29.8:3000/posts"); // Your backend endpoint
    print("Hello1");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'firstname': fn.text,
          'lastname': ln.text,
          'email': email.text,
          'age': int.parse(age.text),
          'gender': selectedGender,
        }),
      );
      print("Hello2");
      if (response.statusCode == 200) {
        // Success
        print("User created: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User registered successfully!")),
        );
      } else {
        // Error
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error registering user.")),
        );
      }
    } catch (e) {
      print("Hello3");
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to connect to the server.")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SignUp Form"),
          backgroundColor: Color.fromARGB(55, 160, 209, 220),
          centerTitle: true,

        ),
        body: SingleChildScrollView(

          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: TextField(
                      controller: fn,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "Enter First Name",
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: ln,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "Enter Last Name",
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Age",
                  labelText: "Age",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                hint: const Text("Select Gender"),
                decoration: const InputDecoration(
                  labelText: "gender",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "male",
                    child: Text("male"),
                  ),
                  DropdownMenuItem(
                    value: "female",
                    child: Text("female"),
                  ),
                  DropdownMenuItem(
                    value: "other",
                    child: Text("other"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: submitForm,
                    child: const Text("Submit")

                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 209, 220),
      ),
    );
  }
}
