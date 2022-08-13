import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaboo_app/model/user_model.dart';
import 'package:logger/logger.dart';

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
          },
          SetOptions(merge: true),
        )
        .then(
            (value) => print("'full_name' & 'age' merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  // update user user details
  Future<void> updateUser(UserModel user) async {
    return users
        .doc(user.uid)
        .set(
          user.toJson(),
        )
        .then((value) => print("user update sussessful!"))
        .catchError((error) => print("Failed to update: $error"));
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
