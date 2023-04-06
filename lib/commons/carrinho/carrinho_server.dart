import 'package:get/get.dart';

class controllerCart extends GetxController {
  final products = {}.obs;
  void AddProduct(product) {
    if (products.containsKey(product)) {
      products[product] += 1;
      print(product);
      print(products);
    } else {
      products[product] = 1;
      print(products);
    }
  }
}
