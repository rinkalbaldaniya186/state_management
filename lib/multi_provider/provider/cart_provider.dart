import 'package:flutter/foundation.dart';
import 'package:state_management/multi_provider/model/product.dart';
import '../model/cart_item.dart';

class CartProvider extends ChangeNotifier{

  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product){

    int index = _cartItems.indexWhere((element) => element.product.name == product.name);

    if(index == -1){
      _cartItems.add(CartItem(product: product));
    }
    else{
      _cartItems[index].quantity++;
    }

  }

}