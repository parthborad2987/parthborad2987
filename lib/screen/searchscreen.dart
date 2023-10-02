// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/models/user.dart';

import '../resources/app_drawer.dart';

class Searchscreen extends StatefulWidget {
  final user;
   const Searchscreen({super.key, required this.user});

   @override
   State<Searchscreen> createState() => _SearchscreenState();
}

@override
class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final product = FirebaseAuth.instance.currentUser!;
    final Ref = FirebaseDatabase.instance.ref(product.uid).child('CardItem');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Search',
          style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,fontSize: 25),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: Stack(children: [
        Padding(padding: const EdgeInsets.all(30),
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)),
            ),
            onChanged: (String? value) {
              setState(() {

              });
            },
          ),),
        Container(height: 800,padding: const EdgeInsets.only(top: 100),
          child: FirebaseAnimatedList(
            query: Ref,
            itemBuilder: (context, snapshot, animation, index) {
              final title = snapshot.child('title').value.toString();
              if(searchController.text.isEmpty) {
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
                        ElevatedButton(style: const ButtonStyle(elevation: MaterialStatePropertyAll(0),backgroundColor: MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            Ref.child(snapshot.child('id').value.toString()).remove();
                          }, child: const Icon(Icons.clear,size: 30,color: Colors.grey,),),
                      ],
                    ),
                  ),
                );
              }if(title.toLowerCase().contains(searchController.text.toLowerCase().toLowerCase())) {
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
                        ElevatedButton(style: const ButtonStyle(elevation: MaterialStatePropertyAll(0),backgroundColor: MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            Ref.child(snapshot.child('id').value.toString()).remove();
                          }, child: const Icon(Icons.clear,size: 30,color: Colors.grey,),),
                      ],
                    ),
                  ),
                );
              }else {
                return Container();
              }
            },
          ),
        ),
      ],
      ),
    );
  }
}
