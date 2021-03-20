import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/Classes/user.dart';

class userInteract {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<Map<String, dynamic>?> getUserConnected() async {
    Map<String, dynamic>? userData;
    final userID = FirebaseAuth.instance.currentUser!.uid;
    await users.doc(userID).get().then((value) {
      if (value.data()!.isEmpty) return null;
      userData = value.data();
    });
    return userData;
  }

  Future<List<Map<String, dynamic>?>> getHomepagePictures() async {
    CollectionReference picturesCollection =
        FirebaseFirestore.instance.collection("Pictures");
    final List<Map<String, dynamic>?> pictures = [];

    await picturesCollection
        .orderBy('date', descending: true)
        .get()
        .then((documents) async {
      for (QueryDocumentSnapshot picDoc in documents.docs) {
        final List<Map<String, dynamic>?> comments = [];
        await picturesCollection
            .doc(picDoc.id)
            .collection('Comments')
            .orderBy('date', descending: true)
            .get()
            .then((docs) {
          for (QueryDocumentSnapshot comDoc in docs.docs) {
            comments.add(comDoc.data());
          }
          if (docs.docs.isNotEmpty) picDoc.data()?["comments"] = comments;
        });
        if (documents.docs.isNotEmpty) pictures.add(picDoc.data());
      }
    });
    return pictures;
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    Map<String, dynamic>? userData;
    await users.where('username', isEqualTo: username).get().then((value) {
      if (value.docs.isEmpty) return null;
      userData = value.docs[0].data();
    });
    return (userData);
  }
}
