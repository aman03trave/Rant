

import 'package:flutter/material.dart';

void main(){
  runApp(
      HomePage()
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 31, 120, 238),
                    Color.fromARGB(255, 158, 186, 199)
                  ],
                )
            )
        )
    );
  }
}
