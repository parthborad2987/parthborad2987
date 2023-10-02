// ignore_for_file: must_be_immutable, sized_box_for_whitespace, unused_import, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/pages/balancepage.dart';
import 'package:shopping_application/provider/card_provider.dart';
import '../resources/app_drawer.dart';

class OrdersPage extends StatefulWidget {
  final String title;
  final String quantity;
  final String price;
   const OrdersPage(this.title,this.price,this.quantity,{super.key,});
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

@override
class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final Orders = FirebaseAuth.instance.currentUser!;
    final Ref = FirebaseDatabase.instance.ref(Orders.uid).child('orderItem');

    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Orders',
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context,);
        }, icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: FirebaseAnimatedList(
        query: Ref,
        itemBuilder: (context, snapshot, animation, index) {
          return ListTile(title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Container(
              width: 100,height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[300]
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 200,
                           child: Text(snapshot.child('title').value.toString(),overflow: TextOverflow.ellipsis,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        ),
                      ],),
                     Text("\$" + snapshot.child('price').value.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text(snapshot.child('quantity').value.toString(),style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('${time.day.toString()}''/''${time.month.toString()}''/''${time.year.toString()}',style: const TextStyle(color: Colors.white,fontSize: 18),)
                  ],)
              ],),
            ),
          ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BalancePage()),);
            },
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
