// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/resources/app_drawer.dart';

  class FavoriteScreen extends StatefulWidget {
    const FavoriteScreen({super.key,});

    @override
    State<FavoriteScreen> createState() => _FavoriteScreenState();
  }

  class _FavoriteScreenState extends State<FavoriteScreen> {
    @override
    Widget build(BuildContext context) {
      final fav = FirebaseAuth.instance.currentUser!;
      final Ref = FirebaseDatabase.instance.ref(fav.uid).child('favorite');

      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Favorite',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios),),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        endDrawer: AppDrawer(),
        body: FirebaseAnimatedList(
          query: Ref,
          itemBuilder: (context, snapshot, animation, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Container(width:100,child: Text(snapshot.child('title').value.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.black,fontSize: 25),),),
              leading: Image.network(snapshot.child('image').value.toString()),
              trailing: IconButton(icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                  Ref.child(snapshot.child('id').value.toString()).remove();
                });
              },),
            ),
          );
        },),
      );
    }
  }
