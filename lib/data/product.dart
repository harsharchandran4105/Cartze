import '../models/product.dart';

class ProductData {

  static List<Product> products = [];

  static void addProduct(Product product) {

    products.add(product);

  }

}