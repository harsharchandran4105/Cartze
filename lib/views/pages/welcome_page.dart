import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/login_page.dart';
import 'package:cartze/views/pages/register_page.dart';
import 'package:flutter/material.dart';

class MyWelcomePage extends StatelessWidget {
  const MyWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/teal2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 320.0, child: Image.asset('assets/images/stu1.jpg')),
          FilledButton(
            onPressed: () {
              Navigator.pushReplacement(context,smoothRoute(MyRegisterPage()));
            },
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xffec5800),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              minimumSize: Size(250.0, 40.0),
            ),
            child: Text("Register", style: TextStyle(fontSize: 25.0)),
          ),
          SizedBox(height: 20.0),
          FilledButton(
            onPressed: () {
              Navigator.pushReplacement(context, smoothRoute(MyLoginPage()));
            },

            style: FilledButton.styleFrom(
              backgroundColor: Color(0xffec5800),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              minimumSize: Size(250.0, 40.0),
            ),
            child: Text("Login", style: TextStyle(fontSize: 25.0)),
          ),
        ],
      ),
    );
  }
}
