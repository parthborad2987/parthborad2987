// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/user.dart';
import '../utils/utils.dart';

class OrderProvider extends ChangeNotifier{
  final databaseRef = FirebaseDatabase.instance.ref('products');
  final List<Product> _cart = [];
  List<Product> get cart{
    return [..._cart];
  }

  Future<void> OrdertoggleCart(Product product,context) async {
    final products = FirebaseAuth.instance.currentUser!;
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final databaseRef = FirebaseDatabase.instance.ref(products.uid);

    databaseRef.child('orderItem').child(id).set({
      'id': id,
      'title':product.title,
      'price':product.price,
      'quantity':product.quantity,
      'getTotalPrice':product.price,
    }).then((value) {
      Utils().toastMessage('Item added');
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  static OrderProvider of(
      BuildContext context,{
        bool listen = true,
      }) {
    return Provider.of<OrderProvider>(context,
        listen: listen
    );
  }
}
