import 'package:cartze/data/constants.dart';
import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/home_page.dart';
import 'package:cartze/views/pages/register_page.dart';
import 'package:cartze/views/pages/role_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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

            Container(
              alignment: Alignment.topLeft,
              height: 450.0,
              width: 280.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal, width: 3.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            smoothRoute(MyRegisterPage()),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xffec5800),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          minimumSize: Size(137.0, 20.0),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),

                      FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            smoothRoute(MyLoginPage()),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          minimumSize: Size(137.0, 20.0),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50.0),
                        SizedBox(
                          height: 50.0,
                          child: TextField(
                            cursorColor: Colors.teal,
                            cursorHeight: 20.0,
                            controller: controller1,
                            decoration: AppStyles.textFieldDecoration("Email"),
                            onEditingComplete: () {
                              setState(() {});
                            },
                          ),
                        ),

                        SizedBox(height: 10.0),
                        SizedBox(
                          height: 50.0,
                          child: TextField(
                            cursorColor: Colors.teal,
                            cursorHeight: 20.0,
                            controller: controller2,
                            decoration: AppStyles.textFieldDecoration(
                              "Password",
                            ),
                            onEditingComplete: () {
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FilledButton(
  onPressed: () async {

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controller1.text.trim(),
        password: controller2.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RolePage(),
        ),
      );

    } on FirebaseAuthException catch (e) {

      String message = "Login failed";

      if (e.code == 'user-not-found') {
        message = "No user found for this email";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

  },
  style: FilledButton.styleFrom(
    backgroundColor: Colors.teal,
    padding: EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 20.0,
    ),
    minimumSize: Size(200.0, 30.0),
  ),
  child: Text(
    "Login",
    style: TextStyle(fontSize: 20.0),
  ),
),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Image.asset('assets/images/ob1.jpg', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
