
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/Pages/signin_page.dart';
import 'package:shopping_application/pages/manage_profile.dart';
import 'package:shopping_application/provider/card_provider.dart';
import 'package:shopping_application/provider/orders_provider.dart';
import 'package:shopping_application/provider/tab_provider.dart';
import 'package:shopping_application/screen/bottem_navigation.dart';
import 'provider/favoriteprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TabProvider(),),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home:  const SignInPage(),
      routes: {
        MyHomescreen.routeName:(ctx) => const MyHomescreen(),
        ManageProfile.routeName:(ctx) => const ManageProfile(),
      },
    ),
  );
}


