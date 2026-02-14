import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplashPage extends StatelessWidget {
  const MySplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lotties/shopping cart.json'),
            SizedBox(height: 20.0),
            FittedBox(
              child: Text(
                "CARTZY",
                style: TextStyle(
                  fontFamily: "Margarine",
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0,
                  color: Colors.white,
                  letterSpacing: 20.0,
                ),
              ),
            ),
            SizedBox(height: 80.0),
            FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  smoothRoute(MyWelcomePage()),
                );
              },

              style: FilledButton.styleFrom(
                backgroundColor: Color(0xffec5800),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                minimumSize: Size(180.0, 40.0),
              ),
              child: Text("Get Started", style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
