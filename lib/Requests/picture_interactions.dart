import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as Path;

class PictureInteractions {
  CollectionReference pictures =
      FirebaseFirestore.instance.collection('Pictures');

  Future<void> addPicture(File picture, String uid) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(picture.path)}');
    await ref.putFile(picture).whenComplete(() async {
      await ref.getDownloadURL().then((value) async {
        pictures.add({
          'pictureLink': value,
          'userID': uid,
          'uploadDate': Timestamp.now(),
          'likes': 0
        }).then((docRef) async {
          await FirebaseFirestore.instance.collection('Users').doc(uid).update({
            "pictures": FieldValue.arrayUnion([docRef.id])
          });
        });
      });
    });
  }

  Future<List<String>> getUserPictures(String uid) async {
    List<String> picturesLink = [];

    debugPrint('salut');

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((doc) async {
      dynamic data = doc.data();
      for (final pictureID in data!['pictures']) {
        await FirebaseFirestore.instance
            .collection('Pictures')
            .doc(pictureID)
            .get()
            .then((pictureDoc) {
          dynamic pictureData = pictureDoc.data();
          picturesLink.add(pictureData!['pictureLink']!);
        });
      }
    });
    return picturesLink;
  }
}
