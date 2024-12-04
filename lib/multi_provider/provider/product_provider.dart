import 'package:flutter/foundation.dart';
import 'package:state_management/multi_provider/model/product.dart';

class ProductProvider extends ChangeNotifier{

  final _products = <Product>[
    Product(name: 'Product-1', price: 100.0),
    Product(name: 'Product-2', price: 200.0),
    Product(name: 'Product-3', price: 300.0),
    Product(name: 'Product-4', price: 400.0),
  ];

  get products => _products;
}
