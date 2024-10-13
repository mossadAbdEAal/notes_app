
import 'package:flutter/material.dart';

class CustomSplashWidget extends StatelessWidget{
  const CustomSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6347A6),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/notes.png',width: 150,height: 150,),


            ),
            const  SizedBox(height: 20,),
            Text('Notes App',style: TextStyle(color: Colors.amber[700],fontWeight: FontWeight.bold,fontSize: 35),)
          ],
        ),
      )
    );
  }

}