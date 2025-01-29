
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main(){
  runApp(Landingpage());
}

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landpage(),
      routes: {
        '/singup': (context) => Signuppage(),
        '/login' : (context) => Loginpage()
      },
    );
  }
}

class Landpage extends StatelessWidget {
  const Landpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40,),
          Text(
            "Rant",
            style: GoogleFonts.greatVibes(
              textStyle: TextStyle(
              fontSize: 70,
              color: Colors.white,
                decoration: TextDecoration.none,
              )
            ),
      ),
          SizedBox(height: 10,),
       Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
           child : CarouselSlider(
             items: [

               //1st Image of Slider
               Container(

                 margin: EdgeInsets.all(3.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.0),
                   image: DecorationImage(
                     image: Image.asset("lib/assets/l1.jpg").image,
                     fit: BoxFit.cover,
                   ),
                 ),
               ),

               //2nd Image of Slider
               Container(
                 margin: EdgeInsets.all(3.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.0),
                   image: DecorationImage(
                     image: Image.asset("lib/assets/l1.jpg").image,
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
             ], options: CarouselOptions(
             height: 300, // Adjust height as needed
             enlargeCenterPage: true,
             autoPlay: true,
             aspectRatio: 16 / 2,
             autoPlayCurve: Curves.fastOutSlowIn,
             enableInfiniteScroll: true,
             autoPlayAnimationDuration: Duration(milliseconds: 800),
             viewportFraction: 0.8,
           ),
           )

       ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/singup');
                },
                child: Text("Sign Up"),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Login"),
              )
            ],
          )




    ]

    )
    )
      ;
  }
}


