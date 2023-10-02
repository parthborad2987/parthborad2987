// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final String getTotalPrice;
  int quantity;
  bool favorite;
  final String rating;

  Product({
    required this.id,
    required this.favorite,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.category,
    required this.rating,
    required this.getTotalPrice,
  });

  factory Product.fromJson(Map<String,dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      category: json['category'],
      rating: json['rating'],
      favorite: json['favorite'], getTotalPrice: json['getTotalPrice'],
      );

  Map<String,dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'image': image,
    'quantity': quantity,
    'category': category,
    'favorite': favorite,
    'rating': rating,
    'getTotalPrice':getTotalPrice
  };
}

