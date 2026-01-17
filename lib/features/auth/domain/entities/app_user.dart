class AppUser {
  // entities variable defination
  final String uid;
  final String email;

  //required name constractor for entities
  const AppUser({required this.uid, required this.email});

  // convert entities to json
  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email};
  }

  // convert json to entities
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(uid: jsonUser['uid'], email: jsonUser['email']);
  }
}
