import 'package:state_management/multi_provider/model/product.dart';

class CartItem{

  Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

}