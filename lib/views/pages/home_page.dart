import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.teal,),
      
      body: Column(
        children: [
          Container(
            height: 210.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 250.0,
          ),
          Image.asset('assets/images/stu2.jpg')
        ],
      ),
    );
  }
}
