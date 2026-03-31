import 'dart:io';

import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/cart_page.dart';
import 'package:cartze/views/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:cartze/data/product.dart';
import 'package:cartze/models/product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {

    List<Product> filteredProducts = ProductData.products.where((product) {
      final query = searchQuery.toLowerCase();
            return product.name.toLowerCase().contains(query) ||
         product.category.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
  title: const Text("Cartzy"),
  backgroundColor: Colors.teal,

  actions: [

    IconButton(
      icon: const Icon(Icons.shopping_cart),

      onPressed: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartPage(),
          ),
        );

      },
    )

  ],
),
      body: Column(
        children: [

          /// HEADER + SEARCH BAR
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          /// PRODUCT GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),

              itemCount: filteredProducts.length,

              itemBuilder: (context, index) {

                final product = filteredProducts[index];

                return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      smoothRoute(
        ProductPage(product: product),
      ),
    );
  },
  child: Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Expanded(
          child: Image.file(File(product.image))
        ),
        Text(product.name),
        Text(product.price),
      ],
    ),
  ),
);
              },
            ),
          ),
        ],
      ),
    );
  }
}