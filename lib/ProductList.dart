
import 'package:assianment_7/Cart.dart';
import 'package:flutter/material.dart';
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {


  List<Product> products = [
   Product('Product 1', 10.0, ),
   Product('Product 2', 15.0, ),
   Product('Product 3', 20.0, ),
   Product('Product 4', 20.0, ),
   Product('Product 5', 20.0, ),
   Product('Product 6', 20.0, ),
   Product('Product 7', 20.0, ),
   Product('Product 8', 20.0, ),
   Product('Product 9', 20.0, ),
   Product('Product 10', 20.0, ),
   Product('Product 11', 20.0, ),
   Product('Product 12', 20.0, ),
   Product('Product 13', 20.0, ),
  ];

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body:ListView.builder(
        shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(products[index].name),
              subtitle: Row(
                children: [

                  Text("\$${products[index].price.toString()}"),
                ],
              ),
              trailing:Column(
                children: [
                  Text("Counter ${products[index].counter}"),
                  Flexible(child: ElevatedButton(onPressed: (){_incrementCOunter(index);},child:const Text('BUY NOW'),))
                ],
              )

            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(products)));
      },child: Icon(Icons.shopping_cart_sharp),),

    );


  }
  void _incrementCOunter(int index){
    setState(() {
      products[index].counter++;
      if (products[index].counter == 5){
        _showCongratulationDialog(products[index].name);
      }
    });
  }
  void _showCongratulationDialog(String productName){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Congratulations!'),
        content: Text("you've bought 5 $productName!"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Close'))
        ],
      );
    });
  }
}


class Product{
  final String name;
  final double price;
  int counter;
  Product(this.name,this.price) : counter = 0;
}