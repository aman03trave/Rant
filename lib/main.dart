import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'landingpage.dart';

void main() {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/landing': (context) => Landingpage(),
      },

    );

  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 31, 120, 238),
              Color.fromARGB(255, 158, 186, 199),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rant",
              style: GoogleFonts.greatVibes(
                textStyle: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
             // Adjust spacing as needed
            Text(
              "we grow together",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            )),
            SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/landing');},
                  icon: Icon(Icons.explore),
                  label: Text("Explore"),


            )
          ],

        ),

    );
  }
}


