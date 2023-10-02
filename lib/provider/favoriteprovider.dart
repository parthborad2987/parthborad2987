// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/utils/utils.dart';
class FavoriteProvider extends ChangeNotifier{
  final List<Product> _FavoriteProvider = [];
  List<Product> get cart{
    return [..._FavoriteProvider];
  }

  Future<void> FavoriteCart(Product product,context) async {

    final fav = FirebaseAuth.instance.currentUser!;
    final databaseRef = FirebaseDatabase.instance.ref(fav.uid);
    String id = DateTime.now().microsecondsSinceEpoch.toString();

    databaseRef.child('favorite').child(id).set({
      'id': id,
      'title':product.title,
      'image':product.image,
      'favorite': product.favorite,
    }).then((value) {
      Utils().toastMessage('Item added');
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });

    if(_FavoriteProvider.contains(product)) {
      for(Product element in _FavoriteProvider) {
        element.quantity++;
      }
    }else {
      _FavoriteProvider.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product user) {
    final isExist = _FavoriteProvider.contains(user);
    return isExist;
  }

  static FavoriteProvider of(
      BuildContext context,{
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(context,
        listen: listen
    );
  }
}
