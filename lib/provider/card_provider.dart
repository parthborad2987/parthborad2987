// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/user.dart';
import '../utils/utils.dart';

class CartProvider extends ChangeNotifier{
  final databaseRef = FirebaseDatabase.instance.ref('products');
  final List<Product> _cart = [];
  List<Product> get cart{
    return [..._cart];
}

 Future<void> toggleCart(Product product,context) async {
   final products = FirebaseAuth.instance.currentUser!;
   String id = DateTime.now().millisecondsSinceEpoch.toString();
   final databaseRef = FirebaseDatabase.instance.ref(products.uid);

   databaseRef.child('CardItem').child(id).set({
     'id': id,
     'title':product.title,
     'description':product.description,
     'image':product.image,
     'price':product.price,
     'category':product.category,
     'quantity':product.quantity,
     'getTotalPrice':product.price,
   }).then((value) {
     Utils().toastMessage('Item added');
   }).onError((error, stackTrace) {
     Utils().toastMessage(error.toString());
   });

    if(_cart.contains(product)) {
      for(Product element in _cart) {
        element.quantity++;
      }
    }else {
      _cart.add(product);
    }
    notifyListeners();
    return Future.value();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  getTotalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
      BuildContext context,{
        bool listen = true,
      }) {
    return Provider.of<CartProvider>(context,
        listen: listen
    );
  }
}
