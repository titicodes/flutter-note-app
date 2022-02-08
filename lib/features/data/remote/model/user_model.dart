import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes_flutter/domain/entities/user_entity.dart';


class UserModel extends UserEntity {
  UserModel({
    final String? email,
    final String? name,
    final String? password,
    final String? uid,
    final String? status,
  }) : super({
          password: password,
          email: email,
          status: status,
          uid: uid,
          name: name
        });

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
        status: documentSnapshot.get('status'),
        email: documentSnapshot.get('email'),
        uid: documentSnapshot.get('uid'),
        name: documentSnapshot.get('name'));
  }

  Map<String, dynamic> toDocument() {
    return {
      'status': status,
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
    };
  }
}
