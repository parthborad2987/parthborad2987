// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:shopping_application/models/user.dart';

class Orders with ChangeNotifier {
  int id;
  final String title;
  final double price;
  final List<Product> product;
  final String getTotalPrice;
  int quantity;

  Orders({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.product,
    required this.getTotalPrice,
  });
}



