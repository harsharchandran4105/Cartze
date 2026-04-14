import 'dart:io';

import 'package:flutter/material.dart';
import '../../data/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int calculateTotal() {

    int total = 0;

    for (var product in Cart.items) {
      total += product.price;   // price is now int
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [

          /// CART ITEMS
          Expanded(
            child: ListView.builder(

              itemCount: Cart.items.length,

              itemBuilder: (context, index) {

                final product = Cart.items[index];

                return ListTile(

                  leading: Image.file(
                    File(product.image),
                    width: 50,
                    fit: BoxFit.cover,
                  ),

                  title: Text(product.name),

                  subtitle: Text("₹${product.price}"),

                  /// REMOVE BUTTON
                  trailing: IconButton(

                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    onPressed: () {

                      setState(() {
                        Cart.items.removeAt(index);
                      });

                    },
                  ),
                );
              },
            ),
          ),

          /// TOTAL PRICE
          Padding(
            padding: const EdgeInsets.all(16),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text(
                  "Total: ₹${calculateTotal()}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// CHECKOUT BUTTON
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffec5800),
                  ),

                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(
                        content: Text("Checkout Successful 🎉"),
                      ),

                    );

                    setState(() {
                      Cart.items.clear();
                    });

                  },

                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}