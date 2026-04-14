import 'dart:io';

import 'package:cartze/utils/app_routes.dart';
import 'package:cartze/views/pages/cart_page.dart';
import 'package:cartze/views/pages/product_page.dart';
import 'package:cartze/views/pages/profile_page.dart';
import 'package:cartze/views/pages/role_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cartze/models/product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String searchQuery = "";
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {

  DatabaseReference productRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("products");

  DatabaseReference orderRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("orders");

  orderRef.once().then((orderSnapshot) {

    List<String> reservedProducts = [];

    final orderData = orderSnapshot.snapshot.value;

    if (orderData != null) {

      final map = Map<String, dynamic>.from(orderData as Map);

      map.forEach((key, value) {

        final order = Map<String, dynamic>.from(value);

        reservedProducts.add(order["productName"]);

      });

    }

    productRef.onValue.listen((event) {

      final data = event.snapshot.value;

      if (data == null) return;

      final map = Map<String, dynamic>.from(data as Map);

      List<Product> loaded = [];

      map.forEach((key, value) {

        final productData = Map<String, dynamic>.from(value);

        /// SKIP RESERVED PRODUCTS
        if (reservedProducts.contains(productData["name"])) {
          return;
        }

        loaded.add(
          Product(
            name: productData["name"],
            category: "Custom",
            price: int.parse(productData["price"].toString()),
            image: productData["image"],
            description: productData["description"],
            sellerId: productData["sellerId"],
          ),
        );

      });

      setState(() {
        products = loaded;
      });

    });

  });

}
  @override
  Widget build(BuildContext context) {

    List<Product> filteredProducts = products.where((product) {
      final query = searchQuery.toLowerCase();
      return product.name.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
  title: const Text(
    "Cartzy",
    style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Colors.teal,

  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),

    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const RolePage(),
        ),
      );
    },
  ),

  actions: [

    IconButton(
      icon: const Icon(Icons.shopping_cart, color: Colors.white),

      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartPage(),
          ),
        );
      },
    ),

    IconButton(
      icon: const Icon(Icons.person, color: Colors.white),

      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          ),
        );
      },
    ),

  ],
),

      body: Column(
        children: [

          /// SEARCH BAR
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
                          child: Image.file(
                            File(product.image),
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(product.name),

                        Text("₹${product.price}"),

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