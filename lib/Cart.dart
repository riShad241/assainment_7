import 'package:flutter/material.dart';

import 'ProductList.dart';
class Cart extends StatelessWidget {
final List<Product> products;

Cart(this.products);

  @override


  Widget build(BuildContext context) {

    int totalproduct = products.fold(0, (sum, product) => sum + product.counter);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),

      body: Center(child: Text('Total product: $totalproduct'),),
    );
  }
}
