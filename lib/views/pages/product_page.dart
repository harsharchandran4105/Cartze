import 'package:cartze/data/cart.dart';
import 'package:cartze/views/pages/confirm_page.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Image.asset(
                product.image,
                height: 250,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
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

            const SizedBox(height: 20),

            const Text(
              "Product description goes here.",
            ),

            const Spacer(),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConfirmPage(product: product),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec5800),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              minimumSize: Size(250.0, 40.0),
                    ),
                    child: const Text("Buy Now",),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Cart.add(product);
                       
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to Cart"),
                        ),
                      );
                    },
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}