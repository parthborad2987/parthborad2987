// ignore_for_file: unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shopping_application/pages/paymentpage.dart';
import 'package:shopping_application/provider/card_provider.dart';

import '../resources/app_drawer.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    final providers = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Balance',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context,);
        }, icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("\$${providers.getTotalPrice()}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,width: 100,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade400,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text('20 sep',style: TextStyle(color: Colors.white,fontSize: 18),),),
              ),
              Container(
                height: 100,width: 100,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade400,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text('20 sep',style: TextStyle(color: Colors.white,fontSize: 18),),),
              ), Container(
                height: 100,width: 100,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade400,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text('20 sep',style: TextStyle(color: Colors.white,fontSize: 18),),),
              ),
            ],),
          const SizedBox(height: 15),
           const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('${'+34,0'}',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('${'+34,0'}',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('${'+34,0'}',style: TextStyle(fontWeight: FontWeight.bold),),
          ],),
          const SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Container(
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Text('Payment Method',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                          const SizedBox(height: 20,),
                          TextButton(
                            onPressed:  (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const PaymentPage()),);
                            },
                            child: const Text('Mobile banking',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                          TextButton(
                            onPressed:  (){},
                            child: const Text('Internet banking',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                          TextButton(
                            onPressed:  (){},
                            child: const Text('SMS banking',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black   ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,)
            ],
          ),
        ],
      ),
      ),
    );
  }
}
