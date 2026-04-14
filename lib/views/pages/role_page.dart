import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/home_page.dart';
import 'package:cartze/views/pages/seller_upload_page.dart';
import 'package:flutter/material.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

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
              image: DecorationImage(
                image: AssetImage('assets/images/teal2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// ROLE BOX
          Container(
            alignment: Alignment.center,
            height: 300.0,
            width: 280.0,

            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 3.0),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 40),

                const Text(
                  "Choose Role",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                /// BUYER BUTTON
                FilledButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      smoothRoute(const MyHomePage()),
                    );

                  },

                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(200.0, 40.0),
                  ),

                  child: const Text(
                    "Buyer",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),

                const SizedBox(height: 20),

                /// SELLER BUTTON
                FilledButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      smoothRoute(const SellerUploadPage()),
                    );

                  },

                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xffec5800),
                    minimumSize: const Size(200.0, 40.0),
                  ),

                  child: const Text(
                    "Seller",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          /// BOTTOM IMAGE
          SizedBox(
            height: 260.0,
            width: double.infinity,
            child: Image.asset(
              'assets/images/ob1.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}