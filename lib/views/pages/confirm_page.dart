import 'dart:io';

import 'package:cartze/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../models/product.dart';

class ConfirmPage extends StatelessWidget {
  final Product product;

  const ConfirmPage({super.key, required this.product});

  Future<void> reserveOrder(BuildContext context) async {

    final user = FirebaseAuth.instance.currentUser;

    DatabaseReference ref = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
    ).ref("orders").push();

    await ref.set({

      "productName": product.name,
      "price": product.price,
      "buyerId": user!.uid,
      "sellerId": product.sellerId,
      "status": "reserved"

    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Order Reserved Successfully"),
      ),
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Confirm Order"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// PRODUCT IMAGE
            Center(
              child: Image.file(
                File(product.image),
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// PRODUCT NAME
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// PRODUCT PRICE
            Text(
              "₹${product.price}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            /// CONFIRM BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffec5800),
                ),

        onPressed: () async {

  await reserveOrder(context);

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const MyHomePage()),
    (route) => false,
  );

},

                

                child: const Text(
                  "Confirm Order",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}