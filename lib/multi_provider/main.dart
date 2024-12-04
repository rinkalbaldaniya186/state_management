import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/multi_provider/model/cart_item.dart';
import 'package:state_management/multi_provider/provider/cart_provider.dart';
import 'package:state_management/multi_provider/provider/product_provider.dart';
import 'model/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider(),),
          ChangeNotifierProvider(create: (context) => CartProvider(),)
        ],
        child: ProductListScreen(),
      ),
      /*home: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: ProductListScreen(),
        ),
      ),*/
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Product> productList  = Provider.of<ProductProvider>(context).products;
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //       // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
        //       },
        //       icon: Icon(Icons.add_shopping_cart))
        // ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productList[index].name),
            subtitle: Text('price : ${productList[index].price}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Product product = productList[index];
                cartProvider.addToCart(product);

                cartProvider.cartItems.forEach((element) {
                  print('name : ${element.product.name}     quantity : ${element.quantity}');
                });
              },
            ),
          );
        },
      ),
    );
  }
}