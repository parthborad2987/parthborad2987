// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_application/screen/card_number_validator.dart';

import '../resources/app_drawer.dart';
import '../utils/utils.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formfiled = GlobalKey<FormState>();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController AcNo = TextEditingController();
  TextEditingController Month = TextEditingController();
  TextEditingController Year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context,);
        }, icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer:const AppDrawer(),
      body: SingleChildScrollView(
    child:Form(
      key: _formfiled,
    child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 290,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child:Container(
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepOrange,
                          Colors.orange
                        ]
                      ),
                      borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          const Text('CARD #1',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white54),),
                          const SizedBox(height: 50),
                          Text(AcNo.text,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Text(cardHolderName.text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            const SizedBox(width: 70),
                            Text(Month.text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                            const Text('/',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                            Text(Year.text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('CARDHOLDER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white54),),
                              SizedBox(width: 70),
                              Text('VALID',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white54),),
                            ],),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,)
            ],
          ),
          const Text('Add new card',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),),
          Padding(padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: cardHolderName,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              decoration: InputDecoration(
                hintText:  'Cardholder name',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
              ),
              validator: (value) {
                if(value!.isEmpty) {
                  return "Enter name";
                }
              },
            ),),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: AcNo,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              decoration: InputDecoration(
                hintText: '0000 0000 0000 0000',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
              ),
              validator: (value) {
                if(value!.isEmpty) {
                  return "Enter Password";
                } else
                if(AcNo.text.length < 15) {
                  return "Password 6 character";
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormattor(),
              ],
            ),),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 1,
                  child: TextFormField(
                    controller: Month,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Month',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter Month";
                      }
                      return null;
                    },
                  ),),
                const SizedBox(width: 30,),
                Expanded(flex: 1,
                  child: TextFormField(
                    controller: Year,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Year',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter year";
                      }
                      return null;
                    },
                  ),),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)
              ),),
              onPressed: () {
                if(_formfiled.currentState!.validate()) {
                  Utils().toastMessage('Payment Successfully');
                }
              }, child: const Text('Add new card',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),))
        ],
      ),
      ),
      ),
    );
  }
}
