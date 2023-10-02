// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Pages/signin_page.dart';
import 'package:shopping_application/screen/bottem_navigation.dart';
import 'package:shopping_application/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formfiled = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const SignInPage()),(context) => false);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.0, 20, 0),
              child: Form(
               key: _formfiled,
               child:Column(
                children: [
                logoWidget("assets/OIP.jpg"),
                const SizedBox(height: 30,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextFormField(
                    controller: _username,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_rounded,color: Colors.white,),
                      hintText: 'User Name',hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.transparent,
                      focusColor: Colors.blue,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter User name";
                      }
                      return null;
                    },
                  ),),
                const SizedBox(height: 20),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined,color: Colors.white,),
                      hintText: 'E-mail',hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.white,)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter Email";
                      }
                      bool emailvalid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                      if(!emailvalid) {
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
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.white,)),
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
                Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextFormField(
                    controller: _confirmpassword,
                    keyboardType: TextInputType.text,
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock,color: Colors.white,),
                      hintText: 'Confirm Password',hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.white,)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter Password";
                      } else
                      if(_password.text.length != _confirmpassword.text.length) {
                        return "pass does not mach";
                      }
                      return null;
                    },
                  ),),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 80),shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  )),
                  onPressed: () {
                    if(_formfiled.currentState!.validate()) {
                      print('success');
                      _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text).then((value) {
                        print('Created New Account');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomescreen()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                    }
                  }, child: const Text('Sign up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
              ],),
            ),
          )
      ),
      ),
    );
  }
}

logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.cover,
    height: 270,
    width: 240,
  );
}
