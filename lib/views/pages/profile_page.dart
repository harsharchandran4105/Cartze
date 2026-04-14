import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String username = "";
  List<String> orders = [];

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadOrders();
  }

  /// LOAD USER NAME
  void loadUserData() {

    DatabaseReference ref = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
    ).ref("users/${user!.uid}");

    ref.onValue.listen((event) {

      final data = event.snapshot.value;

      if (data != null) {

        final map = Map<String, dynamic>.from(data as Map);

        setState(() {
          username = map["name"] ?? "User";
        });

      }

    });

  }

  /// LOAD RESERVED ORDERS
  void loadOrders() {

    DatabaseReference ref = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
    ).ref("orders");

    ref.onValue.listen((event) {

      final data = event.snapshot.value;

      if (data == null) return;

      final map = Map<String, dynamic>.from(data as Map);

      List<String> loaded = [];

      map.forEach((key, value) {

        final order = Map<String, dynamic>.from(value);

        if (order["buyerId"] == user!.uid) {

          loaded.add(
              "${order["productName"]}   ₹${order["price"]}"
          );

        }

      });

      setState(() {
        orders = loaded;
      });

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// HI USERNAME
            Text(
              "Hi $username 👋",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Reserved Orders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// ORDERS LIST
            Expanded(
              child: orders.isEmpty
                  ? const Text("No reserved orders")
                  : ListView.builder(

                      itemCount: orders.length,

                      itemBuilder: (context, index) {

                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.shopping_bag),
                            title: Text(orders[index]),
                          ),
                        );

                      },
                    ),
            ),

            /// LOGOUT BUTTON
            Center(
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),

                onPressed: () async {

                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyLoginPage(),
                    ),
                    (route) => false,
                  );

                },

                child: const Text("Logout"),
              ),
            )

          ],
        ),
      ),
    );
  }
}