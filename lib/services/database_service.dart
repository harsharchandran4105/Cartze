import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {

  final DatabaseReference _db = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://cartzy-8004b-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();

  Future<void> addProduct({
    required String name,
    required String price,
    required String description,
    required String image,
    required String sellerId,
  }) async {

    final productRef = _db.child("products").push();

    await productRef.set({
      "name": name,
      "price": price,
      "description": description,
      "image": image,
      "sellerId": sellerId,
    });

  }
}