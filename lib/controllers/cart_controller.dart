import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var CartItems = <Product>[].obs;

  addtoCart(Product product) {
    CartItems.add(product);
  }
}
