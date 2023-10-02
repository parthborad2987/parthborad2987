// ignore_for_file: sized_box_for_whitespace, unused_import, unnecessary_null_comparison, non_constant_identifier_names, unused_local_variable

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_application/Pages/signin_page.dart';
import 'package:shopping_application/models/profile_model.dart';
import 'package:shopping_application/resources/add_image.dart';
import 'package:shopping_application/screen/favoritescreen.dart';
import 'package:shopping_application/screen/utils.dart';
import 'package:shopping_application/utils/utils.dart';
import '../controllers/google_logout.dart';
import '../resources/app_drawer.dart';

class Profilescreen extends StatefulWidget {

  final ProfileModel profileModel;
  const Profilescreen({super.key,required this.profileModel});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final profile = FirebaseAuth.instance.currentUser!;
  String? imageurl;
  final storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    imageurl = '';
    getDownloadURL();
  }

  Future<void> getDownloadURL() async {
    final ref = storage.ref(profile.uid).child('id');
    final url = await ref.getDownloadURL();
    setState(() {
      imageurl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = FirebaseAuth.instance.currentUser!;
    final databaseRef = FirebaseDatabase.instance.ref(profile.uid).child('profile');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Profile',
          style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,fontSize: 25),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: FirebaseAnimatedList(query: databaseRef, itemBuilder: (context, snapshot, animation, index) {
       return Container(
        padding: const EdgeInsets.only(top: 5,),
        child: Column(
             children: [
               CircleAvatar(
                 radius: 80.0,
                 backgroundImage: NetworkImage(imageurl.toString()),
               ),
               const SizedBox(
                 height: 20,
               ),
                  Column(
                   children: [
                 Center(child: Text(snapshot.child('NickName').value.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
                 const SizedBox(
                 height: 20,
                 ),
                 Center(child:  Text(snapshot.child('Bio').value.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                   ],
                 ),

                       Column(
                         children: [
                           Container(
                             height: 400,
                             child: Padding(
                               padding: const EdgeInsets.all(20.0),
                               child:Container(
                                 width: 400,
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
                                   padding: const EdgeInsets.all(20),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       ListTile(
                                         onTap: (){},
                                         title: const Text('Lorem ipsum',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         leading: const Icon(Icons.account_circle_rounded,color: Colors.redAccent,size: 35,),
                                       ),
                                       ListTile(
                                         onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen()));
                                         },
                                         title: const Text('favorite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         leading: const Icon(Icons.bookmark_border_outlined,color: Colors.redAccent,size: 35,),
                                       ),
                                       ListTile(
                                         onTap: (){},
                                         title: const Text('Ametconsectetuer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         leading: const Icon(Icons.card_giftcard_sharp,color: Colors.redAccent,size: 35,),
                                       ),
                                       ListTile(
                                         leading:  const Icon(Icons.people_alt_outlined,color: Colors.deepOrange,),
                                         title:  const Text('Google Logout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         onTap: () {
                                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleLogout()));
                                         },
                                       ),
                                       ListTile(
                                         onTap: () async {
                                           await _auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage())),);
                                         },
                                         title: const Text('Log out',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                         leading: const Icon(Icons.lock,color: Colors.redAccent,size: 35,),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 80,)
                         ],
                       ),
                  ],
               ),
            );
         }
      ),
    );
  }

 Widget imageProfile() {
      return Center(
      child: Stack(
        children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(widget.profileModel.image),
              ),
        ],
      ),
    );
  }
}




