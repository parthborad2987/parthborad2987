// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously, deprecated_member_use, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Pages/signup_page.dart';
import 'package:shopping_application/screen/bottem_navigation.dart';
import 'package:shopping_application/utils/utils.dart';
import '../controllers/firebase_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
final _formfiled = GlobalKey<FormState>();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;


@override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF673AB7),Color(0xFF4DB6AC)]
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Form(
                   key: _formfiled,
                   child: Column(
                  children: [
                logoWidget("assets/7.jpg"),
                const SizedBox(height: 30,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_rounded,color: Colors.white,),
                      hintText: 'Email',hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.transparent,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      bool emailvalid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if(value.isEmpty) {
                        return "Enter Email";
                      } else if(!emailvalid) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                  ),),
                const SizedBox(height: 20),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock,color: Colors.white,),
                      hintText: 'Password',hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white,),
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter Password";
                      } else
                      if(_password.text.length < 6) {
                        return "Password 6 character";
                      }
                      return null;
                    },
                  ),),
                const SizedBox(height: 20),
                 ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 80),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),),
                      onPressed: () async {
                        final product = FirebaseAuth.instance.currentUser;
                        // FirebaseDatabase.instance.reference().child("product").child(product.uid).child("takip").set({"uid":"uid"});
                        print(product?.uid);
                        if(_formfiled.currentState!.validate()) {
                          _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text).then((value) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomescreen()));
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                          });
                        }
                      }, child: const Text('Sign in',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
                 ),),
                 ),
                const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Image.asset("assets/search.png",width: 60,),
                          onTap: () async {
                            await FirebaseServices().signInWithGoogle();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomescreen()));
                            // Provider.of<LoginComtroller>(context,listen: false).googleLogin();
                          },
                        ),
                        const SizedBox(width: 20,),
                        Image.asset("assets/facebook.png",width: 60,),
                      ],
                    ),                const SizedBox(height: 20,),
                TextButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),);
                }, child: const Text('Create account',
                  style: TextStyle(color: Colors.white60,
                      fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ],),
            ),
          ),
      ),
      ),
    );
  }
}

logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.cover,
    height: 240,
    width: 240,
  );
}
