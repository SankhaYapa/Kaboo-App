class UserModel {
  late String uid;
  late String fname;
  late String lname;
  late String email;
  late String occupation;
  late String status;
  late String goal;

  UserModel({
    required this.uid,
    required this.fname,
    required this.lname,
    required this.email,
    required this.occupation,
    required this.status,
    required this.goal,
  });

  UserModel.fromMap(Map map) {
    uid = map['uid'];
    fname = map['fname'];
    lname = map['lname'];
    email = map['email'];
    occupation = map['occupation'];
    status = map['status'];
    goal = map['goal'];
  }

  Map toJson() => {
        'uid': uid,
        'fname': fname,
        'lname': lname,
        'email': email,
        'occupation': occupation,
        'status': status,
        'goal': goal
      };
  // UserModel.toMap(Map map) {
  //   uid = map['uid'];
  //   fname = map['fname'];
  //   lname = map['lname'];
  //   email = map['email'];
  //   occupation = map['occupation'];
  //   status = map['status'];
  //   goal = map['goal'];
  // }
}
