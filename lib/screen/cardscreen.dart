// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, avoid_types_as_parameter_names, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Pages/orders_page.dart';
import 'package:shopping_application/models/user.dart';
import '../provider/card_provider.dart';
import '../resources/app_drawer.dart';

class Cardscreen extends StatelessWidget {
  final Product product;
   const Cardscreen(this.product, {super.key});

   @override
  Widget build(BuildContext context) {
     final products = FirebaseAuth.instance.currentUser!;
     final Ref = FirebaseDatabase.instance.ref(products.uid).child('CardItem');
     final providers = CartProvider.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF673AB7),Color(0xFF4DB6AC)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor:  Colors.transparent,
          title: const Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        endDrawer: const AppDrawer(),
        body: Stack(children: [
          Container(height: 600,
            child: FirebaseAnimatedList(
              query: Ref,
              itemBuilder: (context, snapshot, animation, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Container(
                        width: 100,height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                                child: Image.network(snapshot.child('image').value.toString()),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: 100,
                                  child: Text(snapshot.child('title').value.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                                ),
                                const SizedBox(height: 10,),
                                Text("\$${snapshot.child('price').value}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),)
                              ],
                            ),
                            ElevatedButton(
                              style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {
                                 Ref.child(snapshot.child('id').value.toString()).remove();
                            }, child: const Icon(Icons.clear,size: 30,color: Colors.grey,),),
                          ],
                        ),
                      ),
                    );
              },
            ),
          ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 10),
               child:
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total:',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 200,
                          child: Text("\$${providers.getTotalPrice().toString()}",overflow: TextOverflow.ellipsis,maxLines: 1,
                            style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
                          ),
                        ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () {
                  Ref.remove();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage(product.quantity.toString(),product.title,product.price.toString(),)));
                  },
                  child: const Text('Checkout',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
                      ],
                    ),
                  ],
                 ),
               ],
            ),
          ),
        ],
       ),
      ),
    );
  }
}


