// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_application/resources/app_drawer.dart';
import 'package:shopping_application/screen/utils.dart';
import 'package:shopping_application/utils/utils.dart';
import '../resources/add_image.dart';

class ManageProfile extends StatefulWidget {
  static var routeName = '/manageprofile';

  const ManageProfile({super.key});

  @override
  State<ManageProfile> createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  TextEditingController Name = TextEditingController();
  TextEditingController Bio = TextEditingController();
  Uint8List? _image;
  void takeCemera() async {
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  void takePhoto() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = FirebaseAuth.instance.currentUser!;
    final databaseRef = FirebaseDatabase.instance.ref(profile.uid).child('profile');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text('Manage Profile',style: TextStyle(fontSize: 20,color: Colors.black,),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          imageProfile(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: Name,
              style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),
              decoration: InputDecoration(
                labelText: 'NickName',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: Bio,
              style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Bio',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () async {
                    String name = Name.text;
                    String bio = Bio.text;
                    String resp = await StoreData().saveData(name: name, bio: bio, file: _image!);
                  },
                  child: const Text('Image',style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () async {
                    databaseRef.child('1').update({
                      'NickName':Name.text,
                      'Bio':Bio.text,
                    }).then((value) {
                      Utils().toastMessage('Item added');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text('Save',style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          _image != null ?
          CircleAvatar(
            radius: 80.0,
            backgroundImage: MemoryImage(_image!),
          ) :
          const CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 50,),
          ),
          Positioned(
            bottom: 15,
            left: 110,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context,
                    builder: ((builder) => bottomsheet()));
              },
              child: const Icon(Icons.add_a_photo,color: Colors.white,),
            ),),
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text('Choose Profile Photo',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  takeCemera();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.camera,color: Colors.black,),
                label: const Text('Camera',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),),
              TextButton.icon(
                onPressed: () {
                  takePhoto();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image,color: Colors.black,),
                label: const Text('Gallery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),),
            ],
          )
        ],
      ),
    );
  }
}

