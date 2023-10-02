// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/controllers/firebase_services.dart';
import 'package:shopping_application/pages/signin_page.dart';
import '../resources/app_drawer.dart';

class GoogleLogout extends StatefulWidget {
  const GoogleLogout({super.key});

  @override
  State<GoogleLogout> createState() => _GoogleLogoutState();
}

class _GoogleLogoutState extends State<GoogleLogout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Logout',
          style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,fontSize: 25),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 80.0,
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL!),
            ),
            const SizedBox(height: 20,),
            Text("${FirebaseAuth.instance.currentUser!.displayName}",
              style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Text("",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
              },
              child: const Text('LogOut')),
        ],),
      ),
    );
  }
}
