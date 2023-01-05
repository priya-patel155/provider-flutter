import 'package:flutter/material.dart';
import 'package:providerpractices/controllers/shopping_controller.dart';
import 'package:providerpractices/controllers/cart_controller.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final ShoppingController = Get.put(ShoppingControllers());
  final cartController = Get.put(CartController());
  ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingControllers>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.ProductItems.length,
                  itemBuilder: (context, int index) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.ProductItems[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.ProductItems[index].productDescription}'),
                                  ],
                                ),
                                Text(
                                    '\$${controller.ProductItems[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addtoCart(controller.ProductItems[index]);
                              },
                              child: Text('Add to Cart'),
                            ),
                          ]),
                    ));
                  });
            }),
          ),
          Text('Total amount :'),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
