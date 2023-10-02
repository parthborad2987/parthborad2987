// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/profile_model.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/provider/tab_provider.dart';
import '../provider/card_provider.dart';
import 'profilescreen.dart';
import 'searchscreen.dart';
import 'cardscreen.dart';
import 'homescreen.dart';


class MyHomescreen extends StatelessWidget {
  static var routeName = '/shop';

  const MyHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product(id: 1, favorite: false, title: 'title', description: 'description', price: double.infinity, image: 'image', quantity: 1, category: 'category', rating: 'rating', getTotalPrice: 'getTotalPrice');
    final providers = CartProvider.of(context);

    return Scaffold(
      body: Stack(
        children: [
      Consumer<TabProvider>(
            builder: (context, tabProvider, _) {
              return IndexedStack(
                index: tabProvider.selectedTab,
                children: [
                  // Add your different pages here
                   Homescreen(),
                   Searchscreen(user: Product(favorite: false, id: DateTime.daysPerWeek, title: 'title', description: 'description', price: double.infinity, image: 'image', quantity: 1, category: 'category', rating: 'rating',getTotalPrice: providers.getTotalPrice().toString())),
                   Cardscreen(Product(title: 'title', description: 'description', price: double.infinity, image: 'image',quantity: 1, category: 'category', rating: '', id: DateTime.march, favorite: false,getTotalPrice:providers.getTotalPrice().toString())),
                   Profilescreen(profileModel: ProfileModel(id: '1', NickName: 'NickName', Bio: 'Bio',image: 'image')),
                ],
              );
            },
          ),
         Padding(
          padding: EdgeInsets.all(25),
        child:Align(
          alignment: const Alignment(0.0,1.0),
          child:Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
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
            child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Consumer<TabProvider>(
            builder: (context, tabProvider,_) {
            return BottomNavigationBar(
            fixedColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: tabProvider.selectedTab,
            onTap: (index) {
            tabProvider.selectedTab = index;
            },
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.search),
            label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),
            label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "",),
            ],
            );
            },
            ),
          )
        ),
       ),
       ),
      ],),
    );
  }
}

// class MyHomescreen extends StatefulWidget {
//   const MyHomescreen({super.key,});
//   @override
//   State<MyHomescreen> createState() => _MyHomescreenState();
// }
//
// class _MyHomescreenState extends State<MyHomescreen> {
//   int _pageIndex = 0;
//   final List<Widget> _tabList = [
//      const Homescreen(),
//      const Searchscreen(),
//      Cardscreen(User(title: 'title', description: 'description', price: double.infinity, image: 'image',quantity: 1, category: 'category', rating: {}, id: DateTime.march)),
//      const Profilescreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//      return  Scaffold(
//   body: Stack(
//     children: [
//       _tabList.elementAt(_pageIndex),
//       Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Align(
//           alignment: const Alignment(0.0,1.0),
//           child:Container(
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(30)),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: BottomNavigationBar(
//               selectedItemColor: Colors.black,
//               unselectedItemColor: Colors.grey,
//               showSelectedLabels: true,
//               showUnselectedLabels: false,
//               currentIndex: _pageIndex,
//               onTap: (int index) {
//                 setState(() {
//                   _pageIndex = index;
//                 });
//               },
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home),
//                 label: "",),
//               BottomNavigationBarItem(icon: Icon(Icons.search),
//                 label: "",),
//               BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),
//                 label: "",),
//               BottomNavigationBarItem(icon: Icon(Icons.person),
//                 label: "",),
//             ],
//            ),
//           ),),
//           ),),
//         ],
//       ),
//     );
//   }
// }