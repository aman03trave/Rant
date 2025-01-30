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
        debugShowCheckedModeBanner: false,
        home: MyFirst(),

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
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  String? selectedGender;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String pass1){
    final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return passRegex.hasMatch(pass1);
  }

  // Function to validate form fields before submitting
  bool validateForm() {
    if (fn.text.isEmpty || email.text.isEmpty || age.text.isEmpty || pass1.text.isEmpty || pass2.text.isEmpty || selectedGender == null) {
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

    if(!isValidPassword(pass1.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid password format.Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character. ")),
      );
      return false;
    }

    if (pass1.text != pass2.text ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match.")),
      );
      return false;
    }

    return true; // All validations passed
  }

  Future<void> submitForm() async {
    if (!validateForm()) {
      return; // Exit the function if validation fails
    }

    final url = Uri.parse("http://192.168.29.8:3000/posts"); // Your backend endpoint

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
          'password': pass1.text,
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
    return Scaffold(
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
              const SizedBox(height: 16),
              TextField(
                controller: pass1,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),

                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextField(
                controller: pass2,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
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

    );
  }
}
