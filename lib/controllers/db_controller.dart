import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kaboo_app/model/user_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class DatabaseController {
  //fireStore instance ctrate
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //save user infoation
  Future<void> saveUserDate(
      String fname,
      String lname,
      String email,
      String password,
      String occution,
      String status,
      String goal,
      String uid) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set(
          {
            'fname': fname,
            'lname': fname,
            'email': email,
            'password': password,
            'occupation': occution,
            'status': status,
            'goal': goal,
            'uid': uid,
            //'img': null
          },
          SetOptions(merge: true),
        )
        .then(
            (value) => print("'full_name' & 'age' merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  // update user user details
  Future<void> updateUser(
    String uid,
    String fname,
    String lname,
    String email,
    String occupation,
    String status,
    File img,
  ) async {
    //upload the image task

    UploadTask? task = uploadFile(img);
    final snapshot = await task!.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    Logger().i(downloadUrl);

    await users.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'email': email,
      'occupation': occupation,
      'status': status,
      'img': img
    });
  }

//upload image to the DB
  UploadTask? uploadFile(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'productImages/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //getUser data
  Future<UserModel?> getUserData(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());

      // UserModel userModel =
      //     UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      UserModel userModel =
          UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      //Logger().d(userModel.toString());
      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
