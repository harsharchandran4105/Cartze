import 'package:flutter/material.dart';
import '../../models/product.dart';

class ConfirmPage extends StatelessWidget {

  final Product product;

  const ConfirmPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Reserve Purchase"),
        backgroundColor: Colors.teal,
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset(
              product.image,
              height: 150,
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Purchase Reserved 🎉"),
                  ),
                );

                Navigator.popUntil(context, (route) => route.isFirst);
              },

              child: const Text("Reserve Purchase"),
            )
          ],
        ),
      ),
    );
  }
}