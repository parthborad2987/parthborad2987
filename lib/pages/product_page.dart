// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, must_be_immutable, avoid_print, sort_child_properties_last, prefer_const_constructors, avoid_types_as_parameter_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/pages/reviewspage.dart';
import 'package:shopping_application/provider/favoriteprovider.dart';
import 'package:shopping_application/provider/orders_provider.dart';
import 'package:shopping_application/screen/bottem_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../provider/card_provider.dart';
import '../resources/app_drawer.dart';

class ProductPage extends StatelessWidget {
  final _pagecontroller = PageController();
  final Product product;
    ProductPage(this.product,{super.key,});

  @override
  Widget build(BuildContext context) {
    final providers = CartProvider.of(context);
    final provider = FavoriteProvider.of(context);
    final orders = OrderProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context,MaterialPageRoute(builder: (context) => const MyHomescreen()),);
        }, icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 300,
                      child: PageView(
                        children: [
                        Page1(),
                        Page1(),
                        Page1(),
                        ],
                        controller: _pagecontroller,
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: _pagecontroller,
                          count: 3,
                          effect:  ScaleEffect(
                            activeDotColor: Colors.orange.shade800,
                            dotColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.deepOrange,
                        Colors.orange
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))
                ),
                child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 250,
                          child: Text(product.title,overflow: TextOverflow.ellipsis,maxLines: 1, style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),),),
                        GestureDetector(
                          onTap: ()  {
                             provider.FavoriteCart(product, context);
                          },
                          child: Icon(
                            provider.isExist(product)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.white,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Container(
                       padding: const EdgeInsets.all(30),
                      child:  ExpandText(product.description,style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: IconButton(onPressed: () {},icon: const Icon(Icons.thumb_up,color: Colors.black,size: 35,)),
                        ),),
                        Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: IconButton(onPressed: () {},icon: Icon(Icons.workspace_premium,size: 35,)),),
                        ),
                        Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ],),
                    const SizedBox(height: 75,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100, width: 150,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                          color: Colors.orange.shade500,
                          borderRadius:  BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: TextButton(
                              child: const Text('Add to Cart',
                                style: TextStyle(fontSize: 20, color: Colors.white),),
                              onPressed: () {
                                 providers.toggleCart(product, context);
                                 orders.OrdertoggleCart(product, context);
                              }),),
                      ),
                      Container(
                        height: 100, width: 150,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                          color: Colors.orange.shade500,
                          borderRadius:  BorderRadius.all(Radius.circular(10),),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: TextButton(
                              child: const Text('Reviews',
                                style: TextStyle(fontSize: 20, color: Colors.white),),
                              onPressed: ()  {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReviewsPage()));
                              }),),
                      ),
                    ],),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      )
    );
  }

 Widget Page1() {
   return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.transparent,
            child:  Center(child: Image.network(product.image),),
          ),
        ),
      ),
    );
  }
}

