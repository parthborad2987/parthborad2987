// ignore_for_file: sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unused_local_variable, non_constant_identifier_names, dead_code, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/pages/searchdelegate.dart';
import 'package:shopping_application/responsive_helper.dart';
import 'package:shopping_application/screen/home.dart';

import '../resources/app_drawer.dart';

class Homescreen extends StatefulWidget {

   const Homescreen({super.key,});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Product user = Product(id: 1, favorite: false, title: 'title', description: 'description', price: double.infinity, image: 'image', quantity: 1, category: 'category', rating: 'rating', getTotalPrice: 'getTotalPrice');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Catalogue', style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: Home(user),
          tablet: Home(user),
          desktop: Home(user),
        ),
      ),
    );
  }
}





