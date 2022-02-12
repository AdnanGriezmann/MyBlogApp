import 'dart:io';

import 'package:blogging_app/App/Data/Models/Getblogmodel.dart';
import 'package:blogging_app/App/Modules/Login/Bindings/Loginbinding.dart';
import 'package:blogging_app/App/Modules/Login/Views/LoginView.dart';
import 'package:blogging_app/App/Utils/Dailog.dart';
import 'package:blogging_app/App/Utils/indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  bool _hasMoreData = true;
  DocumentSnapshot? lastDocument;
  int _documentLimit = 15;
  final ScrollController controller = ScrollController();
  var isLoading = false.obs;
  Future<void> createUserCredential(String name, String email) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        'uid': _auth.currentUser!.uid,
        'name': name,
        'email': email,
      }).then((value) {
        Indicator.CloseLoading();
        Get.to(() => LoginView(), binding: LoginBinding());
      });
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<void> uploadBlog(String title, String description, File image) async {
    try {
      String id = generateId();
      String imageUrl = await uploadImage(image);

      Map<String, dynamic> blogDetails = {
        'id': id,
        'title': title,
        'description': description,
        'img': imageUrl,
        'time': DateTime.now(),
      };
      await _firebaseFirestore.collection('blogs').doc(id).set(blogDetails);
    } catch (e) {
      showAlert('$e');
    }
  }

  Future<String> uploadImage(File file) async {
    try {
      String imagename = generateId();
      var reference = _storage.ref().child('/images').child('/$imagename.jpg');

      var uploadTask = await reference.putFile(file);
      String url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (e) {
      showAlert('$e');
      return '';
    }
  }

  Future<List<BlogModel>> getBlogs() async {
    if (_hasMoreData) {
      if (!isLoading.value) {
        try {
          if (lastDocument == null) {
            Indicator.ShowLoading();

            await _firebaseFirestore
                .collection('blogs')
                .orderBy('time')
                .limit(_documentLimit)
                .get()
                .then((value) {
              print(value);

              lastDocument = value.docs.last;
              if (value.docs.length < _documentLimit) {
                _hasMoreData = false;
              }
              Indicator.CloseLoading();
              return value.docs
                  .map((e) => BlogModel.fromJson(e.data()))
                  .toList();
            });
          } else {
            isLoading.value = true;
            await _firebaseFirestore
                .collection('blogs')
                .orderBy('time')
                .startAfterDocument(lastDocument!)
                .limit(_documentLimit)
                .get()
                .then((value) {
              print(value);
              lastDocument = value.docs.last;
              if (value.docs.length < _documentLimit) {
                _hasMoreData = false;
              }
              isLoading.value = false;
              var list =
                  value.docs.map((e) => BlogModel.fromJson(e.data())).toList();
                  print(list[0].description);
              return list;
              
            });
          }
        } catch (e) {
          showAlert('$e');
        }
      }
    } else {
      print('No data');
      return [];
    }
    return [];
  }
}
