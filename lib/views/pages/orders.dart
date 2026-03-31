import '../../models/product.dart';

class Orders {

  static List<Product> pendingOrders = [];

  static void reserve(Product product) {

    pendingOrders.add(product);

  }

}