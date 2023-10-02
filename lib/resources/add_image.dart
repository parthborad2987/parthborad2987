import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage  = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final profile = FirebaseAuth.instance.currentUser!;


class StoreData {
  Future<String> uploadImageToStorage(String childName,Uint8List file) async {
    Reference ref = _storage.ref(profile.uid).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String dawnloadUrl = await snapshot.ref.getDownloadURL();
   return dawnloadUrl;
  }

  Future<String> saveData({
    required String name,
    required String bio,
    required Uint8List file,
  }) async {
    String resp = "Some Error Occurred";
    try{
      if(name.isEmpty || bio.isEmpty) {
        String imageUrl = await uploadImageToStorage('profileImage', file);
        await _firestore.collection('UserProfile').add({
          'name': name,
          'bio': bio,
          'imageLink': imageUrl,
        });
        resp = 'success';
      }
    } catch(err) {
     resp = err.toString();
    }
    return resp;
  }
}