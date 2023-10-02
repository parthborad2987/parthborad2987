import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Pages/orders_page.dart';
import 'package:shopping_application/controllers/google_logout.dart';
import 'package:shopping_application/pages/manage_profile.dart';
import 'package:shopping_application/screen/bottem_navigation.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? imageurl;
  final profile = FirebaseAuth.instance.currentUser!;
  final storage = FirebaseStorage.instance;

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
    return Drawer(elevation: 0,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName:  Text('${FirebaseAuth.instance.currentUser!.displayName}'),
            accountEmail: const Text(''),
            currentAccountPicture: GestureDetector(
              child:  CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.white,
                child: Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
              ),
            ),
          ),
          AppBar(
            elevation: 0,
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop,color: Colors.deepOrange,),
            title: const Text('Shop'),
            onTap: () {
               Navigator.of(context).pushReplacementNamed(MyHomescreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_basket,color: Colors.deepOrange,),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrdersPage('title', 'price', 'quantity')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit,color: Colors.deepOrange,),
            title: const Text('Manage Profile'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ManageProfile.routeName);
            },
          ),
          ListTile(
            leading:  const Icon(Icons.people_alt_outlined,color: Colors.deepOrange,),
            title:  const Text('Google Logout'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleLogout()));
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.settings,color: Colors.deepOrange,),
          //   title: const Text('Profile'),
          //   onTap: () {
          //     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profilescreen(profileModel: ProfileModel(id: '1', NickName: 'NickName', Bio: 'Bio',image: 'image'))));
          //   },
          // ),
          const Divider(),
          ListTile(
            title: const Text("Close"),
            trailing: const Icon(Icons.close,color: Colors.deepOrange),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
